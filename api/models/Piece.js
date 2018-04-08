/**
 * Piece.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {

  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
    id: {
      columnName: 'cd_piece',
      type: 'number',
      primaryKey: true,
      autoIncrement: true
    },
    titre: {
      type: "string"
    },
    description: {
      type: "string"
    },
    modeles: {
      collection: "modele",
      via: "cd_piece",
      through: "modele_piece"
    },
    produits: {
      collection: "produit",
      via: "cd_piece",
      through: "produit_piece"
    }

  }
};

