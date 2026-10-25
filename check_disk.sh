
#!/bin/bash

SEUIL="${1:-80}"

UTILISATION=$(df / | tail -1 | awk '{print $(NF-1)}' | tr -d '%')
if [ "$UTILISATION" -ge "$SEUIL" ]; then
    echo "ALERTE : espace disque utilisé à ${UTILISATION}% !"
    exit 1
else
    echo "Espace disque OK : ${UTILISATION}% utilisé."
    exit 0
fi
