import java.util.ArrayList;

public class SATVariable {
    // Class representing a SATVariable used for managing state in SAT problems with fluents and actions.

    private int timestep; // Represents the timestep at which the variable is relevant.
    private int identifier; // Unique identifier for the variable.
    private boolean isFluent; // True if this variable represents a fluent, false if it represents an action.

    private ArrayList<Integer> preconditions; // List of preconditions where this variable is involved.
    private ArrayList<Integer> positiveEffects; // List of positive effects caused by this variable.
    private ArrayList<Integer> negativeEffects; // List of negative effects caused by this variable.

    // Constructor to initialize a SATVariable with its timestep, identifier, and type (fluent or action).
    public SATVariable(int timestep, int identifier, boolean isFluent) {
        this.timestep = timestep;
        this.identifier = identifier;
        this.isFluent = isFluent;
        this.preconditions = new ArrayList<>();
        this.positiveEffects = new ArrayList<>();
        this.negativeEffects = new ArrayList<>();
    }

    // Getter method for identifier.
    public int getIdentifier() {
        return identifier;
    }

    // Getter method for timestep.
    public int getTimestep() {
        return timestep;
    }

    // Method to add a precondition to the list.
    public void addPrecondition(int precondition) {
        preconditions.add(precondition);
    }

    // Method to add a positive effect to the list.
    public void addPositiveEffect(int effect) {
        positiveEffects.add(effect);
    }

    // Method to add a negative effect to the list.
    public void addNegativeEffect(int effect) {
        negativeEffects.add(effect);
    }

    // Method to check if the variable is a fluent.
    public boolean isFluent() {
        return isFluent;
    }

    // Custom equals method to check equivalence based on the identifier field.
    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        SATVariable other = (SATVariable) obj;
        return identifier == other.identifier;
    }

    // Getters for preconditions, positive effects, and negative effects.
    public ArrayList<Integer> getPreconditions() {
        return preconditions;
    }

    public ArrayList<Integer> getPositiveEffects() {
        return positiveEffects;
    }

    public ArrayList<Integer> getNegativeEffects() {
        return negativeEffects;
    }

    // Overridden toString method to provide detailed information about the variable.
    @Override
    public String toString() {
        String result = "Variable ID: " + identifier;
        result += "\nPreconditions: " + preconditions;
        result += "\nPositive Effects: " + positiveEffects;
        result += "\nNegative Effects: " + negativeEffects;
        return result;
    }
}
