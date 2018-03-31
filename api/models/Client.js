/**
 * Client.js
 *
 * @description :: TODO: You might write a short summary of how this model works and what it represents here.
 * @docs        :: http://sailsjs.org/documentation/concepts/models-and-orm/models
 */

module.exports = {
  autoCreatedAt: false,
  autoUpdatedAt: false,
  attributes: {
	  nom:{
        type:"string", 
        required:true
      },
      prenom:{
        type:"string",
        required:true
      },
      adresse:{
        type:"string",
        required:true
      },
	  telephone:{
        type:"string",
        required:true
      }
  }
};

