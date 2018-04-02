/**
 * Client.js
 *
 * @description :: A model definition.  Represents a database table/collection/etc.
 * @docs        :: https://sailsjs.com/docs/concepts/models-and-orm/models
 */

module.exports = {
	autoCreatedAt: false,
	autoUpdatedAt: false,
  attributes: {
	client.id:{
			type: 'number',
			autoIncrement: true
	},
	nom:{
			type:"string"
	},
	prenom:{
			type:"string"
	},
	mail:{
			type:"string"
	},
	telephone:{
			type:"string"
	},
	portable:{
			type:"string"
	},
	adresse_numero:{
			type:"string"
	},
	adresse:{
			type:"string"
	},
	Adresse_complementaire:{
			type:"string"
	},
	adresse_ville:{
			type:"string"
	},
	adresse_codepostale:{
			type:"string"
	}

  },

};

