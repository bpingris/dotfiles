#!/bin/env python3

import subprocess
import random

gradients = [
    ('#373B44', '#4286f4'),
    ('#C79081', '#DFA579'),
    ('#0F2027', '#203A43', '#2C5364'),
    ('#0f0c29', '#302b63', '#24243e'),
    ('#141E30', '#243B55'),
    ('#355C7D', '#6C5B7B', '#C06C84'),
    ('#0B486B', '#F56217'),
    ('#2980b9', '#2c3e50')

]


def apply_gradient_background():
    gradient = random.choice(gradients)

    gradient_points = ''.join([f'-add {point} ' for point in gradient])

    cmd = f'hsetroot {gradient_points} -gradient {random.randint(0, 360)}'
    subprocess.Popen(cmd.split())

    # output, error = process.communicate()


apply_gradient_background()
