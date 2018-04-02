/**
 * Projet_paiement.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  autoCreatedAt: false,
  autoUpdatedAt: false,
  id: false,
  attributes: {
    date_avancement: {
      type: "string"
    },
    cd_paiement: {
      model: "paiement"
    },
    cd_projet: {
      model: "projet"
    }

  }
};

