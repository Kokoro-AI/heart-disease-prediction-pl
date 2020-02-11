kokoro_help :- 
  write("╔═══════════════════════════════════════════╗"), nl,
  write("║ Welcome to Kokoro-AI                      ║"), nl,
  write("║ Try with the following rules              ║"), nl,
  write("║                                           ║"), nl,
  write("║ Get all the diseases for all the patients ║"), nl,
  write("║   disease(X, Y).                          ║"), nl,
  write("║                                           ║"), nl,
  write("║ Get all the diseases for lucas            ║"), nl,
  write("║   disease(lucas, Y).                      ║"), nl,
  write("║                                           ║"), nl,
  write("║ Get all the patients with atherosclerotic ║"), nl,
  write("║   disease(lucas, Y).                      ║"), nl,
  write("╚═══════════════════════════════════════════╝").

use_module(library(apply)).
use_module(library(yall)).

patient(2,1,3).
patient(2,2,3).
patient(5,2,3).
patient(20,2,3).

disease(patient(27,1,3)) :- true.
disease(patient(21,1,3)) :- true.

symptom(age(I), patient(X, _, _)) :- X > I -> true; false.

symptom(chest_pain, patient(_, 1, _)) :- true.
symptom(chest_pain, patient(_, 2, _)) :- false.
symptom(chest_pain, patient(_, 3, _)) :- true.

/*
disease(Patient) :- symptom(age(1), Patient), symptom(chest_pain, Patient).
*/

has_chest_pain :- findall((age = Age), patient(Age, _, _), ChestPainList), write(ChestPainList).
has_chest_pain2 :- 
  findall(patient(Age, ChestPain, Asd), disease(patient(Age, ChestPain, Asd)),ChestPainList),
  maplist([X]>>C is X+2, ChestPainList).
  