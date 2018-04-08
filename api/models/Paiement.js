/**
 * Paiement.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
    id: {
      columnName: 'cd_paiement',
      type: 'number',
      primaryKey: true,
      autoIncrement: true
    },
    etape: {
      type: "string"
    },
    pourcentage_paiement: {
      type: "string"
    },
    projets: {
      collection: "projet",
      via: "cd_paiement",
      through: "projet_paiement"
    }

  }
};

