/*
 * Copyright (c) 2010 by Damien Pellier <Damien.Pellier@imag.fr>.
 *
 * This file is part of PDDL4J library.
 *
 * PDDL4J is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * PDDL4J is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with PDDL4J.  If not, see <http://www.gnu.org/licenses/>
 */

package fr.uga.pddl4j.problem.operator;

import fr.uga.pddl4j.util.BitVector;

import java.io.Serializable;

/**
 * This class implements a fluent description. The class fluent description is used to represents the preconditions and
 * the effects of the action and the method. The class uses a bit vector representation of the fluents.
 *
 * @author D. Pellier
 * @version 1.0 - 07.06.2010
 * @since 4.0
 * @see BitVector
 */
public interface FluentDescription extends Serializable {

    /**
     * Returns the positive fluents of the fluent description. This method is equivalent of
     * <code>this.getPositiveTimedGoalDescription().getAtStart()</code>.
     *
     * @return the positive fluents of the fluent description.
     */
    BitVector getPositiveFluents();

    /**
     * Returns the positive fluents of the fluent description. This method is equivalent of
     * <code>this.getNegativeTimedGoalDescription().getAtStart()</code>.
     *
     * @return the negative fluents of the fluent description.
     */
    BitVector getNegativeFluents();

    /**
     * Returns if fluent description is empty, i.e., if the fluent description has no positive and no negative
     * fluent. Such a goal description is always true.
     *
     * @return <code>true</code> if the fluent description is empty; <code>false</code> otherwise.
     */
    boolean isEmpty();

    /**
     * Returns the cardinality of the fluent description, i.e., the number of fluents defined the positive and negative
     * timed fluent description.
     *
     * @return the cardinality of the fluent description.
     */
    int cardinality();

    /**
     * Returns if this abstract fluent description is consistent. A fluent description is consistent a fluent is at the
     * same postive and negative.
     *
     * @return <code>true</code> if this abstract fluent description is consistent <code>false</code> otherwise.
     */
    boolean isConsistent();

}
