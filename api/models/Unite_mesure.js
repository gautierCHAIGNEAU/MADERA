/**
 * Unite_mesure.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
    id: {
      columnName: 'cd_unite',
      type: 'number',
      primaryKey: true,
      autoIncrement: true
    },
    nom: {
      type: "string"
    },
    composants: {
      collection: "composant",
      via: "cd_unite",
      through: "composant_unite"
    }

  }
};

