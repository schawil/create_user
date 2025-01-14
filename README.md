# Script de création d'un utilisateur

## Description

Ce script Bash permet de créer un utilisateur sur un système Linux avec les caractéristiques suivantes :
- **Nom d'utilisateur** : spécifié par l'utilisateur.
- **Commentaire** : une brève description de l'utilisateur.
- **Shell par défaut** : le shell utilisé pour l'utilisateur.
- **Durée de validité** : spécifiée en jours à partir de la date de création de l'utilisateur.
- **Quota disque** : la quantité d'espace disque attribuée à l'utilisateur (en Go).
- **Plage horaire de connexion** : restreint l'utilisateur à se connecter uniquement entre 8h00 et 18h00.

## Prérequis

- Le script nécessite des privilèges **root** ou **sudo** pour être exécuté.
- Le quota disque doit être activé sur le système (vérifiez si les quotas sont activés avec `quota --enable`).

## Fonctionnement

### Arguments requis

Le script prend 5 arguments à passer en ligne de commande dans cet ordre :
1. **Nom d'utilisateur** : Le nom de l'utilisateur à créer.
2. **Commentaire** : Le commentaire à associer à l'utilisateur.
3. **Shell** : Le shell par défaut de l'utilisateur (par exemple, `/bin/bash`).
4. **Durée de validité** : La durée de validité du compte en jours à partir de la création.
5. **Quota disque** : Le quota disque en Go alloué à l'utilisateur.

### Exemple d'utilisation

```bash
./create_user.sh adama "je suis adama" /bin/bash 10 2
