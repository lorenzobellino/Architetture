# Architetture
Laboratori per il corso Architetture dei sistemi di Elaborazione - Politecnico di Torino Anno 2022

* [Laboratorio 1](https://github.com/lorenzobellino/Architetture/blob/master/Laboratori/Lab01/lab_01.pdf)  
Esercizi di scrittura programmi in assembler MIPS:
  + [programma 0](https://github.com/lorenzobellino/Architetture/blob/main/Laboratori/Lab01/program_0.s)  
  Scrivere un programma in cui, dato un array (```A```) trovare quante volte il valore a 8 bit ```val = 0x2f``` ricorre in esso. L'array contiene 100 valori unsigned a 16 bit, trovare le occorrenze sia negli 8 bit più significativi sia in quelli meno significativi di ciascun elemento a 16 bit dell' array. salvare il risultato in una variabile a 8 bit (```res```).
  + [programma 1](https://github.com/lorenzobellino/Architetture/blob/main/Laboratori/Lab01/program_1.s)  
Dati due array (```A``` e ```B```) calcolare la somma con segno e salvare ciascun valore in un terzo array ```C``` (dove ```C[i] = A[i] + B[i]```), ogni array contiene 30 valori a 8 bit. Inoltre creare due variabili ```threshold_high``` e ```threshold_low```, per ogni valore ```C[i]``` controllare se è maggiore o minore di una data threshold, nel caso sia maggiore incrementare ```threshold_high``` altrimenti incrementare ```threshold_low```. In fine cercare nell array ```C``` sia il massimo che il minimo e salvarli in due variabili allocate in memoria chiamate ```max``` e ```min```.
* [Laboratorio 2](https://github.com/lorenzobellino/Architetture/blob/main/Laboratori/Lab02/lab_02.pdf)  
Esercizi di scrittura programmi in assembler MIPS:
  + [programma 2](https://github.com/lorenzobellino/Architetture/blob/main/Laboratori/Lab02/program_2.s)   
  Scrivere un programma in assembler MIPS che implementi ola seguente funzione:  
  ```
  for (i = 0; i < 40; i++){
    V5[i] = V1[i] + (V2[i] * V3[i]);
    V6[i] = V5[i] * V4[i];
    V7[i] = V6[i] / V2[i];
  }
  ```
  Assumere che i vettori ```V1[]```, ```V2[]```, ```V3[]``` e ```V4[]``` contengano 40 valori a doppia precisione floating point, assumere anche che ```V2[]```  non contenga 0 e che ```V5[]```, ```V6[]``` e ```V7[]``` siano array vuoti anch'essi allocati in memoria.
  + [programma 3](https://github.com/lorenzobellino/Architetture/blob/main/Laboratori/Lab02/program_3.s)  
  scrivere un programma in assembler MIPS in grado di restituire l'output della computazione in figura:  
  ![](https://github.com/lorenzobellino/Architetture/blob/main/img/img1.png)  
  e completare la tabella in base alle diverse configurazioni.
* [Laboratorio 3](https://github.com/lorenzobellino/Architetture/blob/master/Laboratori/Lab01/Lab_03.pdf)  
  Esercizi di scrittura programmi in assembler MIPS e ottimizzazione: effettua il calcolo a mano e con il simulatore dei colpi di clock necessari per eseguire il programma nelle sue varianti.
    + [programma 2_a](https://github.com/lorenzobellino/Architetture/blob/main/Laboratori/Lab03/program_2_a.s)  
    Partendo dal [programma 2](https://github.com/lorenzobellino/Architetture/blob/main/Laboratori/Lab02/program_2.s) del laboratorio precedente ottimizzalo effettuando rescheduling in modo da eliminare più hazard possibili.
    + [programma 2_b](https://github.com/lorenzobellino/Architetture/blob/main/Laboratori/Lab03/program_2_b.s)  
    Partendo dal [programma 2_a](https://github.com/lorenzobellino/Architetture/blob/main/Laboratori/Lab03/program_2_a.s) ailita il branch delay slot ed effettua il re-scheduling delle istruzioni per migliorare ulteriormente il tempo di esecuzione.
    + [programma 2_c](https://github.com/lorenzobellino/Architetture/blob/main/Laboratori/Lab03/program_2_c.s)  
    Partendo dal [programma 2_b](https://github.com/lorenzobellino/Architetture/blob/main/Laboratori/Lab03/program_2_b.s) effettua l'unrolling (4 volte) e se necessario effettua re-scheduling e il renaming dei registri usati
* [Laboratorio 4](https://github.com/lorenzobellino/Architetture/blob/master/Laboratori/Lab01/Lab_04.pdf)  
Introduzione a Gem5: [soluzione](https://github.com/lorenzobellino/Architetture/blob/master/Laboratori/Lab01/lab_04.pdf)  
* [Laboratorio 5](https://github.com/lorenzobellino/Architetture/blob/master/Laboratori/Lab01/Lab_05.pdf)
