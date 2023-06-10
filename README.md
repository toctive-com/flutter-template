# Tocktive Flutter Template

> A ready to work template for Tocktive team that has all basic block to
> start developing a flutter application

# Files

    ── assets
    ├── lib
    │   ├── core
    │   │   ├── apis
    │   │   ├── config
    │   │   ├── constants
    │   │   ├── dependency_injection
    │   │   ├── interceptors
    │   │   ├── theme
    │   │   ├── utils
    │   │   │   ├── dio
    │   │   │   └── shared_preference
    │   │   └── widgets
    │   └── modules
    │       └── example
    │           ├── controller
    │           │   └── cubit
    │           ├── models
    │           ├── repository
    │           └── view
    │               └── widgets
    └── test

## Get Project dependencies

    flutter pub get

## State Management

we use **flutter bloc** package (**Cubit**) for state Management

 <img src="https://raw.githubusercontent.com/felangel/bloc/master/docs/assets/bloc_architecture.png" alt="Bloc Architecture" width="80%">

<a href="https://bloclibrary.dev/#/"> Documentation </a>
