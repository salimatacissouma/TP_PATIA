import fr.uga.pddl4j.heuristics.state.FastForward;
import fr.uga.pddl4j.parser.DefaultParsedProblem;
import fr.uga.pddl4j.plan.Plan;
import fr.uga.pddl4j.plan.SequentialPlan;
import fr.uga.pddl4j.planners.AbstractPlanner;
import fr.uga.pddl4j.problem.DefaultProblem;
import fr.uga.pddl4j.problem.Fluent;
import fr.uga.pddl4j.problem.Problem;
import fr.uga.pddl4j.problem.State;
import fr.uga.pddl4j.problem.operator.Action;
import fr.uga.pddl4j.util.BitVector;

import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;
import picocli.CommandLine;

import java.util.ArrayList;

import org.sat4j.core.VecInt;
import org.sat4j.maxsat.SolverFactory;
import org.sat4j.specs.ContradictionException;
import org.sat4j.specs.IProblem;
import org.sat4j.specs.ISolver;
import org.sat4j.specs.TimeoutException;

/**
 * The class is a SAT planner. Solves a pddl problem using a SAT solver
 *
 * // @author A. Apeloig, M. Clerget, Y. Cheriti
 */
@CommandLine.Command(name = "SAT", version = "SAT 1.0", description = "Solves a specified planning problem using a SAT encoding.") 

public class SATPlanner extends AbstractPlanner {
    /**
     * The class logger.
     */
    private static final Logger LOGGER = LogManager.getLogger(SATPlanner.class.getName());

    /**
     * Instantiates the planning problem from a parsed problem.
     *
     * @param problem the problem to instantiate.
     * @return the instantiated planning problem or null if the problem cannot be
     *         instantiated.
     */
    @Override
    public Problem instantiate(DefaultParsedProblem problem) {
        final Problem pb = new DefaultProblem(problem);
        pb.instantiate(); // here we instantiate our problem (we ground it).
        return pb;
    }

        /**
     * Adds positive and negative effects to the given action variable.
     *
     * @param effect The unconditional effect of an action.
     * @param actionVar The SATVariable representing the action.
     * @param fluentIndices Array mapping fluent indices to their SAT variable counterparts.
     * @param offset Number to increment the fluent index by for future timesteps.
     */
    private void addEffects(UnconditionalEffect effect, SATVariable actionVar, int[] fluentIndices, int offset) {
        BitVector posEffects = effect.getPositiveFluents();
        for (int bit = 0; bit < posEffects.length(); bit++) {
            if (posEffects.get(bit)) {
                actionVar.addPositiveEffect(fluentIndices[bit] + offset);
            }
        }

        BitVector negEffects = effect.getNegativeFluents();
        for (int bit = 0; bit < negEffects.length(); bit++) {
            if (negEffects.get(bit)) {
                actionVar.addNegativeEffect(fluentIndices[bit] + offset);
            }
        }
    }

    /**
     * Maps fluents and actions to SAT variables. Each proposition is associated with a unique integer.
     * This method handles the transformation and tracking of these propositions over time steps.
     * It starts numbering from 1 as SAT solvers like SAT4J do not accept 0 as a variable identifier.
     * 
     * @param fluents List of fluents in the problem.
     * @param actions List of actions in the problem.
     * @param numAction The current time step up to which actions need to be processed.
     * @param previousVars List of previously created SATVariables to be updated.
     * @return Updated list of SATVariables with added new fluents and actions for the given timestep.
     */
    private ArrayList<SATVariable> mapPropsToVars(ArrayList<Fluent> fluents, ArrayList<Action> actions, int numAction,
            ArrayList<SATVariable> previousVars) {
        int previousStep = previousVars.isEmpty() ? 0 : numAction - 1;
        int varIndex = previousVars.isEmpty() ? 1 : previousVars.size() + 1;

        for (int timestep = previousStep; timestep < numAction; timestep++) {
            int[] fluentIndices = new int[fluents.size()];

            // Transform fluents into SATVariables for this timestep
            for (int fIdx = 0; fIdx < fluents.size(); fIdx++) {
                SATVariable fluentVar = new SATVariable(timestep, varIndex, true);
                fluentIndices[fIdx] = varIndex;
                varIndex++;
                if (!previousVars.contains(fluentVar)) {
                    previousVars.add(fluentVar);
                }
            }

            // Transform actions into SATVariables for this timestep
            for (Action action : actions) {
                SATVariable actionVar = new SATVariable(timestep, varIndex, false);

                // Set positive preconditions for actions
                BitVector posPreconds = action.getPrecondition().getPositiveFluents();
                for (int bit = 0; bit < posPreconds.length(); bit++) {
                    if (posPreconds.get(bit)) {
                        actionVar.addPrecondition(fluentIndices[bit]);
                    }
                }

                // Set positive and negative effects for actions
                addEffects(action.getUnconditionalEffect(), actionVar, fluentIndices, fluents.size() + actions.size());

                varIndex++;
                if (!previousVars.contains(actionVar)) {
                    previousVars.add(actionVar);
                }
            }
        }

        return previousVars;
    }
    /**
     * Generates transition clauses for SAT based on actions and fluents.
     * Handles creation of action implications, state changes, and action restrictions.
     *
     * @param satVariables List of SATVariables representing fluents and actions.
     * @param previousClauses List of previously created clauses to be updated.
     * @param lastStep The last timestep to process.
     * @param varsPerTimestep Number of variables generated per timestep.
     * @return Updated list of clauses for the SAT problem.
     */
    private ArrayList<int[]> createTransitionClauses(ArrayList<SATVariable> satVariables,
                                                     ArrayList<int[]> previousClauses, int lastStep, int varsPerTimestep) {
        int startTime = previousClauses.isEmpty() ? 0 : lastStep - 1;

        // Iterate over each time step
        for (int timeStep = startTime; timeStep < lastStep; timeStep++) {
            // Process each variable in the current timestep
            for (SATVariable variable : satVariables) {
                if (variable.getTimeStep() != timeStep) continue;

                if (!variable.isFluent()) {
                    createActionClauses(variable, previousClauses);
                } else {
                    createStateChangeClauses(variable, satVariables, timeStep, varsPerTimestep, previousClauses);
                }
            }
            // Limit actions per timestep
            enforceSingleActionPerTimestep(satVariables, timeStep, previousClauses);
        }

        return previousClauses;
    }

    /**
     * Generates SAT clauses for action preconditions and effects.
     * This includes implications that if an action is taken, its preconditions must hold,
     * and its effects (both positive and negative) will occur.
     *
     * @param action The SATVariable representing an action.
     * @param clauses The list of clauses to which new clauses will be added.
     */
    private void createActionClauses(SATVariable action, ArrayList<int[]> clauses) {
        // Create clauses for action preconditions and effects
        action.getPreconditions().forEach(precond -> clauses.add(new int[]{-action.getIdentifier(), precond}));
        action.getPositiveEffects().forEach(posEff -> clauses.add(new int[]{-action.getIdentifier(), posEff}));
        action.getNegativeEffects().forEach(negEff -> clauses.add(new int[]{-action.getIdentifier(), -negEff}));
    }

    /**
     * Generates clauses related to state changes caused by fluents.
     * This function handles the creation of clauses that model the effects of fluents changing state due to actions.
     *
     * @param fluent The SATVariable representing a fluent.
     * @param allVariables List of all SATVariables including actions and fluents.
     * @param timeStep Current timestep for which the clauses are being generated.
     * @param offset Number of variables per timestep, used to find the corresponding fluent in the next timestep.
     * @param clauses List of clauses to be updated with new state change clauses.
     */
    private void createStateChangeClauses(SATVariable fluent, ArrayList<SATVariable> allVariables, int timeStep, int offset, ArrayList<int[]> clauses) {
        int nextFluentName = fluent.getIdentifier() + offset;
        ArrayList<Integer> actionsWithPosEffect = new ArrayList<>();
        ArrayList<Integer> actionsWithNegEffect = new ArrayList<>();

        // Check effects of each action
        allVariables.forEach(action -> {
            if (!action.isFluent() && action.getTimeStep() == timeStep) {
                action.getPositiveEffects().forEach(posEffect -> {
                    if (posEffect == nextFluentName) actionsWithPosEffect.add(action.getIdentifier());
                });
                action.getNegativeEffects().forEach(negEffect -> {
                    if (negEffect == nextFluentName) actionsWithNegEffect.add(action.getIdentifier());
                });
            }
        });

        // Create clauses for fluent changes
        clauses.add(createStateClause(fluent.getIdentifier(), -nextFluentName, actionsWithPosEffect));
        clauses.add(createStateClause(-fluent.getIdentifier(), nextFluentName, actionsWithNegEffect));
    }

    /**
     * Helper method to construct a clause from a fluent change and associated actions.
     *
     * @param fluent Identifier of the fluent affected.
     * @param nextFluent Identifier of the next state of the fluent, negated if it's a negative change.
     * @param actions List of action identifiers that cause the change.
     * @return An array representing the clause.
     */
    private int[] createStateClause(int fluent, int nextFluent, ArrayList<Integer> actions) {
        int[] clause = new int[actions.size() + 2];
        clause[0] = fluent;
        clause[1] = nextFluent;
        for (int i = 0; i < actions.size(); i++) {
            clause[i + 2] = actions.get(i);
        }
        return clause;
    }

    /**
     * Enforces that only one action can occur at each timestep.
     * This is implemented by creating clauses that ensure if one action occurs, no other action can occur simultaneously.
     *
     * @param satVariables List of all SATVariables including actions.
     * @param timeStep Current timestep for this enforcement.
     * @param clauses List of clauses to which new restrictions will be added.
     */
    private void enforceSingleActionPerTimestep(ArrayList<SATVariable> satVariables, int timeStep, ArrayList<int[]> clauses) {
        ArrayList<Integer> handledActions = new ArrayList<>();

        // Ensure only one action occurs per timestep
        satVariables.forEach(action -> {
            if (action.isFluent() || action.getTimeStep() != timeStep || handledActions.contains(action.getIdentifier()))
                return;

            satVariables.forEach(otherAction -> {
                if (otherAction.isFluent() || otherAction.getIdentifier() == action.getIdentifier() || otherAction.getTimeStep() != timeStep)
                    return;

                clauses.add(new int[]{-action.getIdentifier(), -otherAction.getIdentifier()});
            });
            handledActions.add(action.getIdentifier());
        });
    }
    
    /**
     * Solves a planning problem by encoding it as a SAT problem and using a SAT solver.
     * The method translates fluents and actions into SAT variables, creates clauses
     * for initial and goal states, transition rules, and solves them using SAT4J.
     *
     * @param problem the problem to solve.
     * @return the plan found or null if no plan was found.
     */
    @Override
    public Plan solve(final Problem problem) {
        // Initialize essential variables and lists
        ArrayList<Fluent> fluents = new ArrayList<>(problem.getFluents());
        ArrayList<Action> actions = new ArrayList<>(problem.getActions());
        ArrayList<SATVariable> satVariables = new ArrayList<>();
        int varsPerTimeStep = fluents.size() + actions.size();

        // Create an empty plan
        Plan solvedPlan = new SequentialPlan();

        // Initialize heuristic solver for action estimation
        FastForward ff = new FastForward(problem);
        State init = new State(problem.getInitialState());
        int numActions = ff.estimate(init, problem.getGoal());

        // Indicator to determine when the solution is found
        boolean solved = false;

        // Main loop to try solving the problem, incrementing number of actions if necessary
        while (!solved) {
            // Create the solver instance
            ISolver solver = SolverFactory.newDefault();
            solver.newVar(1000000); // Specify the maximum number of variables
            solver.setExpectedNumberOfClauses(500000); // Specify an estimate of the number of clauses

            // Construct SAT variables for the current number of actions
            satVariables = mapPropsToVars(fluents, actions, numActions - 1, satVariables);

            // Define clauses for initial and goal states, and transitions
            ArrayList<int[]> initClauses = new ArrayList<>();
            ArrayList<int[]> goalClauses = new ArrayList<>();
            ArrayList<int[]> transitionClauses = new ArrayList<>();

            // Create initial state clauses
            createInitialStateClauses(problem.getInitialState(), satVariables, initClauses);

            // Adjust and create transition clauses for the current setup
            transitionClauses = createTransitionClauses(satVariables, transitionClauses, numActions, varsPerTimeStep);

            // Prepare goal state clauses
            prepareGoalStateClauses(problem.getGoal(), goalClauses, numActions, varsPerTimeStep);

            // Add all clauses to the solver
            addClausesToSolver(solver, initClauses);
            addClausesToSolver(solver, transitionClauses);
            addClausesToSolver(solver, goalClauses);

            // Attempt to solve the SAT problem
            solved = solveSATProblem(solver, satVariables, actions, fluents.size(), varsPerTimeStep, solvedPlan);

            if (!solved) {
                numActions++;  // Increment the number of actions and try again
                System.out.println("Incremented action count to " + numActions);
            }
        }

        return solvedPlan;
    }

    /**
     * Creates initial state clauses from the problem's initial state.
     *
     * @param initialState The initial state containing positive fluents.
     * @param satVariables List of all SAT variables representing actions and fluents.
     * @param initClauses List to store generated clauses.
     */
    private void createInitialStateClauses(BitVector initialState, ArrayList<SATVariable> satVariables, ArrayList<int[]> initClauses) {
        for (SATVariable var : satVariables) {
            if (var.getTimeStep() == 0 && var.isFluent()) {
                int[] clause = new int[1];
                clause[0] = initialState.get(var.getIdentifier() - 1) ? var.getIdentifier() : -var.getIdentifier();
                initClauses.add(clause);
            }
        }
    }

    /**
     * Prepares goal state clauses based on the problem's goal state.
     *
     * @param goal The goal state of the problem.
     * @param goalClauses List to store generated clauses.
     * @param numActions Total number of action steps considered.
     * @param varsPerTimeStep Number of variables generated per time step.
     */
    private void prepareGoalStateClauses(Goal goal, ArrayList<int[]> goalClauses, int numActions, int varsPerTimeStep) {
        BitVector goalState = goal.getPositiveFluents();
        for (int i = 1; i <= goalState.length(); i++) {
            if (goalState.get(i - 1)) {
                goalClauses.add(new int[]{i + varsPerTimeStep * numActions});
            }
        }
    }

    /**
     * Adds a list of clauses to a SAT solver.
     *
     * @param solver The SAT solver to which clauses will be added.
     * @param clauses List of clauses to be added.
     */
    private void addClausesToSolver(ISolver solver, ArrayList<int[]> clauses) {
        clauses.forEach(clause -> {
            try {
                solver.addClause(new VecInt(clause)); // Convert array to VecInt and add to solver
            } catch (ContradictionException e) {
                e.printStackTrace();
            }
        });
    }

    /**
     * Attempts to solve the SAT problem and constructs the plan if successful.
     *
     * @param solver The SAT solver.
     * @param satVariables List of SAT variables used in the problem.
     * @param actions List of all possible actions.
     * @param numFluents Number of fluents, used to calculate variable positions.
     * @param varsPerTimeStep Number of variables per timestep.
     * @param solvedPlan The plan to populate if the problem is solvable.
     * @return True if a solution was found, otherwise false.
     */
    private boolean solveSATProblem(ISolver solver, ArrayList<SATVariable> satVariables, ArrayList<Action> actions, int numFluents, int varsPerTimeStep, Plan solvedPlan) {
        try {
            if (solver.isSatisfiable()) {
                int[] model = solver.model(); // Get the model from the solver if the problem is satisfiable
                for (SATVariable var : satVariables) {
                    if (!var.isFluent() && model[var.getIdentifier() - 1] > 0) { // Check if the variable (action) is true in the model
                        int actionIndex = (var.getIdentifier() % varsPerTimeStep) - numFluents - 1;
                        Action act = actions.get(actionIndex);
                        solvedPlan.add(var.getTimeStep(), act);
                    }
                }
                return true;
            }
        } catch (TimeoutException | ContradictionException e) {
            e.printStackTrace();
        }
        return false;
    }

    /**
     * The main method of the <code>ASP</code> planner.
     *
     * @param args the arguments of the command line.
     */
    public static void main(String[] args) {
        try {
            final SATPlanner planner = new SATPlanner();
            CommandLine cmd = new CommandLine(planner);
            cmd.execute(args);
        } catch (IllegalArgumentException e) {
            LOGGER.fatal(e.getMessage());
        }
    }
}