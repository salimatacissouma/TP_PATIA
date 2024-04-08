/*
 * Copyright (c) 2016 by Damien Pellier <Damien.Pellier@imag.fr>.
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

package fr.uga.pddl4j.parser;

/**
 * Thrown to indicate that a malformed expression is occurred. An expression is malformed when an expression has wrong
 * number of arguments or children expression according to its connector.
 *
 * @author Damien Pellier
 * @version 1.0 - 13-06-2022
 * @see Expression
 */
public class MalformedExpressionException extends RuntimeException {

    /**
     * Creates a new malformed expression exception.
     *
     * @see Exception#Exception()
     */
    public MalformedExpressionException() {
        super();
    }

    /**
     * Creates a new malformed expression exception with a specific message.
     *
     * @param message the message.
     * @see Exception#Exception(String)
     */
    public MalformedExpressionException(String message) {
        super(message);
    }


}
