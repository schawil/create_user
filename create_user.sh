#!/bin/bash

# Vérification du nombre d'arguments
if [ "$#" -ne 5 ]; then
    echo "Usage: $0 <username> <comment> <shell> <validity> <disk_quota>"
    exit 1
fi

# Assignation des arguments aux variables
USERNAME=$1
COMMENT=$2
SHELL=$3
VALIDITY=$4
DISK_QUOTA=$5

# Vérification si l'utilisateur existe déjà
if id "$USERNAME" &>/dev/null; then
    echo "L'utilisateur '$USERNAME' existe déjà."
    exit 2
fi

# Création de l'utilisateur avec les options spécifiées
sudo useradd -m -c "$COMMENT" -s "$SHELL" -e $(date -d "$VALIDITY days" +%Y-%m-%d) "$USERNAME"

# Définition du mot de passe par défaut
echo "$USERNAME:inf3611" | sudo chpasswd

# Forcer l'utilisateur à changer son mot de passe lors de la première connexion
sudo chage -d 0 "$USERNAME"

# Définition du quota disque
sudo setquota -u "$USERNAME" 0 $((DISK_QUOTA * 1024)) 0 $((DISK_QUOTA * 1024)) -a

# Plage horaire autorisée pour la connexion (8h00 - 18h00)
echo "$USERNAME" | sudo tee -a /etc/security/time.conf
echo "login ; * ; * ; Al0800-1800" | sudo tee -a /etc/security/time.conf

# Confirmation de la création
echo "L'utilisateur '$USERNAME' a été créé avec succès avec les paramètres suivants :"
echo "Commentaire : $COMMENT"
echo "Shell : $SHELL"
echo "Durée de validité : $VALIDITY jours"
echo "Quota disque : ${DISK_QUOTA}Go"
echo "Plage horaire de connexion : de 8h00 à 18h00"
