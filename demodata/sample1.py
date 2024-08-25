from manim import *

class CircleAndSquare(Scene):
    def construct(self):
        circle = Circle(color = RED)                       # Mobject機能
        circle.move_to([2, 2, 0])                          # Mobject機能

        square = Square(color = GREEN, side_length = 4.0)  # Mobject機能
        self.add(square)                                   # Scene機能

        circleAnim = circle.animate.move_to([-2, -2, 0])   # Animation機能
        self.play(circleAnim)                              # Scene機能
