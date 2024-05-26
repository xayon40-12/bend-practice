# Simple Bend programs

This is a repo to practice Bend language from [HigherOrderCompany](https://higherorderco.com/).

## Run the programs

First you need to [install rust](https://rustup.rs). Then, once `cargo` is properly setup, install `bend-lang` and `hvm`:
```bash
cargo +nightly install hvm
cargo +nightly install bend-lang
```

Then use `bend` to run any `.bend` file in this repo:
```bash
bend run-c <name>.bend <args>
```
where `<name>` is the name of the file and `<args>` correspond to the optional arguments.  
NOTE: Instead of `run-c` that runs the program in parallel on CPU, there is `run` that only use a signle CPU core, and `run-cu` that runs in parallel on an NVIDIA GPU.  
NOTE 2: Some of the programs in this repo currently require specifically `run-c`.

Here is a list of the available programs and there properties:

| `<name>` | `<args>` | need `run-c` | description |
|----------|----------|--------------|-------------|
| complex  |          | No           | Implementation of complex numbers |
| string   |          | No           | Some helper functions on String |
| render   | U24: Size as a power of 2 | Yes | Performs a 2D rendering |

### Example


```
bend run-c render.bend 4

          @@@@@@@@@@@@          
      @@$$$$%%%%%%%%$$$$@@      
    @@$$%%====;;;;====%%$$@@    
  @@$$%%==;;::::::::;;==%%$$@@  
  $$%%==;;::,,,,,,,,::;;==%%$$  
@@$$==;;::,,,,....,,,,::;;==$$@@
@@%%==::,,,,........,,,,::==%%@@
@@%%;;::,,............,,::;;%%@@
@@%%;;::,,............,,::;;%%@@
@@%%==::,,,,........,,,,::==%%@@
@@$$==;;::,,,,....,,,,::;;==$$@@
  $$%%==;;::,,,,,,,,::;;==%%$$  
  @@$$%%==;;::::::::;;==%%$$@@  
    @@$$%%====;;;;====%%$$@@    
      @@$$$$%%%%%%%%$$$$@@      
          @@@@@@@@@@@@          
Result: *
```
