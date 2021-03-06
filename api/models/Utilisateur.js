/**
 * Utilisateur.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
    id: {
      columnName: 'cd_utilisateur',
      type: 'number',
      primaryKey: true,
      autoIncrement: true
    },
    identifiant: {
      type: "string"
    },
    mot_de_passe: {
      type: "string"
    },
    mail: {
      type: "string"
    },
    acces: {
      type: "string"
    }

  }
};

