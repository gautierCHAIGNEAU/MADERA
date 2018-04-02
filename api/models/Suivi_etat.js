/**
 * Suivi_etat.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  autoCreatedAt: false,
  autoUpdatedAt: false,
  id: false,
  attributes: {
    date_suivi: {
      type: "string"
    },
    cd_devis: {
      model: "devis"
    },
    cd_etat: {
      model: "etat_devis"
    }

  }
};

