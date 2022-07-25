# Mars Rover

[![Elixir CI](https://github.com/shmink/MarsRover/actions/workflows/elixir.yml/badge.svg)](https://github.com/shmink/MarsRover/actions/workflows/elixir.yml)

This tech test was a lot of fun. I did time box it to the two hours, but thankfully I noticed on the brief I could extend it to 3 :)

## Running the program

```
mix compile
mix run start.exs
```

This will put you into the program such that you can input your data as is mentioned on the brief, i.e.

```
4 8
(2, 3, E) LFRFF
(0, 2, N) FFLFRFF
```

## Rover Instructions

Enter grid size (m x n). Leave space between values, example format [m n]:

```
4 8
```

Add as many robots as like on a new line after hitting return:

```
(2, 3, E) LFRFF
(0, 2, N) FFLRFF
(2, 3, N) FLLFR
(1, 0, S) FFRLF

```

Hit return as a blank entry after the last robot to see results:

```
(4, 4, E)
(0, 4, N) LOST
(2, 3, W)
(1, 0, S) LOST
```

## Given more time

- I would like to have made the inputs safer to ensure more reliable data to use. For example, entering "crash" would lead to a crash.

- A docker image would also have been a nice to have. Because it's such a simple program that relies on the terminal only, being installation agnostic would have been a nice touch for the user experience.
