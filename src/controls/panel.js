'use strict';

var L = require('leaflet');

var panelControl = L.Control.extend({
  options: {
    position: 'topright'
  },

  onAdd: function (map) {
    // Add reference to map.
    map.panelControl = this;

    // Main panel div.
    this._div = L.DomUtil.create('div', 'panel-control');

    // Header for panel control.
    var headerDiv = document.createElement('div');
    headerDiv.setAttribute('class', 'panel-header');
    headerDiv.innerHTML = '<a href=""><img src="assets/css/images/logo.png" style="display: block; margin-left: auto; margin-right: auto;width: 50%;" alt="logo"/></a>';
    this._div.appendChild(headerDiv);

    // Wait icon displayed while solving.
    this._waitDisplayDiv = document.createElement('div');
    this._waitDisplayDiv.setAttribute('class', 'wait-display');
    var waitIcon = document.createElement('i');
    waitIcon.setAttribute('id', 'wait-icon');
    this._waitDisplayDiv.appendChild(waitIcon);
    this._div.appendChild(this._waitDisplayDiv);

    // Initial displayed message.
    this._initDiv = document.createElement('div');


    // Table for vehicles display.
    this._vehiclesDiv = document.createElement('div');
    this._vehiclesDiv.setAttribute('id', 'panel-vehicles');

    // Table for jobs display.
    this._jobTable = document.createElement('table');
    this._jobTable.setAttribute('id', 'panel-jobs');
    this._jobTable.setAttribute('class', 'panel-table');

    // Table for job-ordered solution display.
    this._solutionTable = document.createElement('table');
    this._solutionTable.setAttribute('id', 'panel-solution');
    this._solutionTable.setAttribute('class', 'panel-table');

    var tableDiv = document.createElement('div');

    tableDiv.appendChild(this._vehiclesDiv);
    tableDiv.appendChild(document.createElement('hr'));
    tableDiv.appendChild(this._jobTable);
    tableDiv.appendChild(this._solutionTable);
    this._div.appendChild(tableDiv);

    // Prevent events on this control to alter the underlying map.
    L.DomEvent.disableClickPropagation(this._div);
    L.DomEvent.on(this._div, 'mousewheel', L.DomEvent.stopPropagation);

    return this._div;
  },

  onRemove: function(map) {
    // Remove reference from map.
    delete map.panelControl;
  },

  clearJobDisplay: function() {
    // Delete jobs display.
    for (var i = this._jobTable.rows.length; i > 0; i--) {
      this._jobTable.deleteRow(i -1);
    }
  },

  clearVehiclesDisplay: function() {
    // Delete vehicles div.
    this._vehiclesDiv.innerHTML = "";
  },

  clearDisplay: function() {
    this.clearJobDisplay();
    this.clearVehiclesDisplay();
    this.showInitDiv();
  },

  clearSolutionDisplay: function() {
    for (var i = this._solutionTable.rows.length; i > 0; i--) {
      this._solutionTable.deleteRow(i -1);
    }
  },

  hideJobDisplay: function() {
    this._jobTable.style.display = 'none';
  },

  showJobDisplay: function() {
    this._jobTable.style.display = 'block';
  },

  hideInitDiv: function() {
    this._initDiv.style.display = 'none';
  },

  showInitDiv: function() {
    this._initDiv.style.display = 'block';
  },

  toggle: function() {
    if (this._div.style.visibility == 'hidden') {
      this._div.style.visibility = 'visible';
    } else {
      this._div.style.visibility = 'hidden';
    }
  },

  getWidth: function() {
    var width = this._div.offsetWidth;
    if (this._div.style.visibility == 'hidden') {
      width = 0;
    }
    return width;
  }
});

var panelControl = new panelControl();

module.exports = panelControl;
