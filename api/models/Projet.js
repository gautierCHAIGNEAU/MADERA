/**
 * Projet.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
    id: {
      columnName: 'cd_projet',
      type: 'number',
      primaryKey: true,
      autoIncrement: true
    },
    titre: {
      type: "string"
    },
    date_creation: {
      type: "string"
    },
    cd_client: {
      model: "client"
    },
    paiements: {
      collection: "paiement",
      via: "cd_projet",
      through: "projet_paiement"
    }
    
  }
};

