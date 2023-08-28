#import "modules/template.typ": *
#import "@local/finite:0.1.0": *

#show: doc => project(
    curso: (
        sigla: "IIC2223",
        nombre: "Teoría de Autómatas y Lenguajes Formales",
        departamento: "Departamento de Ciencia de la Computación",
    ),
    autor: (
        nombre: "Matías",
        apellido: "Fernández Taipe",
        email: "matias.fernandez@uc.cl",
    ),
    numero_de_tarea: 1,
    fecha: "28 de Agosto de 2023",
    body: doc
)

#pregunta[

    Sea $Σ = {a, b}$. Demuestre que los siguientes lenguajes son regulares, es decir, que existe un autómata finito determinista $cal(A)$ tal que $L = cal(L)(cal(A))$:
    -  Las palabras sobre $Σ$ que tienen una cantidad par de letras $a$ y una cantidad par de letras $b$, simultáneamente.
    - Las palabras sobre $Σ$ donde la cantidad de letras $a$ en las posiciones pares es par y la cantidad de letras $a$ en posiciones impares es impar. Asuma que la primera letra de una palabra tiene posición 1.

    #solution[
        - Vamos a hacer un automata en donde cada estado esté defindo por un par donde cada cual representa la paridad de la letra $a$ y la de la letra $b$ dentro de la palabra.

        #automaton(
            (
                q00: (q01: "b", q10: "a"),
                q01: (q00: "b", q11: "a"),
                q10: (q00: "a", q11: "b"),
                q11: (q01: "a", q10: "b")
            ),
            start: "q00",
            stop: "q00",
            style:(
                state: (fill: luma(248), stroke:luma(120)),
            ),
            layout: layout.fixed.with(pos:(
                q00: (0,0), q01: (0,-3), q10: (3,0), q11: (3,-3)
            ))
        )

        - Para el segundo lenguaje, vamos a hacer un automata en donde cada estado esté defindo por una tupla de tres componentes donde la primera componente representa la paridad de la letra que se está leyendo, la segunda componente representa la paridad de la letra $a$ en las posiciones pares y la tercera componente representa la paridad de la letra $a$ en las posiciones impares.

        #automaton(
            (
                q000: (q110: "a", q100: "b"),
                q001: (q111: "a", q101: "b"),
                q010: (q100: "a", q110: "b"),
                q011: (q101: "a", q111: "b"),
                q100: (q001: "a", q000: "b"),
                q101: (q000: "a", q001: "b"),
                q110: (q011: "a", q010: "b"),
                q111: (q010: "a", q011: "b")
            ),
            start: "q000",
            stop: ("q001", "q101"),
            style:(
                state: (fill: luma(248), stroke:luma(120)),
                q101-q000: (curve:-5),
                q110-q011: (curve:-5),
            ),
            layout: layout.fixed.with(pos:(
                q000: (0,0), q110: (0,-3), q100: (3,0), q010: (3,-3),
                q001: (6,0), q111: (6,-3), q101: (9,0), q011: (9,-3)
            ))
            // layout: layout.snake.with(columns: 3)
        )
    ]
]