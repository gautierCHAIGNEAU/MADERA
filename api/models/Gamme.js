/**
 * Gamme.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
    id: {
      columnName: 'cd_gamme',
      type: 'number',
      primaryKey: true,
      autoIncrement: true
    },
    finition: {
      type: "string"
    },
    isolant: {
      type: "string"
    },
    couverture: {
      type: "string"
    },
    qualite_huisserie: {
      type: "string"
    }
  }
};

