/**
 * Module_composant.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
    id: {
      type: 'number',
      primaryKey: true,
      autoIncrement: true
    },
    quantite: {
      type: "string"
    },
    cd_module: {
        
      model: "module"
    },
    cd_composant: {
      model: "composant"
    }

  }
};

