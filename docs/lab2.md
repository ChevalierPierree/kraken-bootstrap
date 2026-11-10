Pull request obligatoire : le ruleset protection-main refuse tout push direct sur main, donc chaque modification passe par une PR qui lance la CI kraken.
Checks bloquants : la PR ne peut être fusionnée que si kraken / lint-test (ruff et pytest) et kraken / build-push (construction de l'image depuis le Dockerfile) sont verts, donc un test cassé comme un Dockerfile cassé bloquent la fusion.
Constaté sur la PR 2 : avec un test cassé, lint-test a échoué, build-push a été ignoré et la fusion était bloquée ; elle n'a été possible qu'après correction du test.
