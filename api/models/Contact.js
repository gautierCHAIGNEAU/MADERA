/**
 * Contact.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
    id: {
      columnName: 'cd_contact',
      type: 'number',
      primaryKey: true,
      autoIncrement: true
    },
    nom: {
      type: "string"
    },
    prenom: {
      type: "string"
    },
    mail: {
      type: "string"
    },
    telephone: {
      type: "string"
    },
    portable: {
      type: "string"
    },
    cd_fournisseur: {
      model: "fournisseur"
    }

  }
};

