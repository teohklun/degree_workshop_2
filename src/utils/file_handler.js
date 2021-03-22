'use strict';

var api = require('../config/api');
var geocoder = require('./geocoder');
var address = require('./address');
var locationHandler = require('./locations');
var dataHandler = require('./data_handler');
var solutionHandler = require('./solution_handler');
var panelControl = require('../controls/panel');

var reader = new FileReader();
var readerGeo = new FileReader();

readerGeo.onerror = function(event) {
  alert("File could not be read! Code " + event.target.error.code);
};

window.loadJsonWithData = function(jData){
  data = jData;
  panelControl.hideInitDiv();
  dataHandler.setData(data);
  // console.log(data);
  dataHandler.closeAllPopups();
  dataHandler.checkControls();

  // Plot solution if current file contains one.
  if (('output' in data) && ('code' in data['output'])) {
    dataHandler.setSolution(data);
    solutionHandler.plotSolution();
  }

  dataHandler.fitView();
}

window.loadJsonWithData2 = function(jData){
  var data = jData
    // dataHandler.setOutput(JSON.parse(event.target.result));
    
    var cars = {};
    var counter = 0;
    var tasks = {};
    // jobList.append(Job(x+1,[1],[pickupDeliveryMorning.iloc[x]["lgtd"], pickupDeliveryMorning.iloc[x]["lat"]] , [pickupDeliveryMorning.iloc[x]["zip"]], [] ))
    var array = JSON.parse(jData);
    array.routes.forEach(function(route, i) {
      // console.log(entry);
      cars[i] = {};
      cars[i]['id'] = route.vehicle;
      cars[i]['start'] = route.steps[0]['location'];
      cars[i]['end'] = route.steps[0]['location'];
      cars[i]['capacity'] = 99999;
      cars[i]['time_window'] = [0, 14400]
      if("name" in route.steps[0]){
        // console.log("received");
        cars[i]['name'] = route.steps[0].name;
      }

      if("description" in route){
        // console.log("received");
        cars[i]['name'] = route.description;
      }
      
      route.steps.forEach(function(job) {
        // counter = 1;
        if(job.type == "job") {
          tasks[counter] = {};
          if("description" in job){
            tasks[counter]['description'] = job.description;
          }
          tasks[counter]['id'] = job.job;
          tasks[counter]['delivery'] = [1];
          tasks[counter]['location'] = job.location;
          tasks[counter]['service'] = 300;
          // tasks[counter]["description"] = "some street name";
          counter ++;
          // tasks[i]['zip'] = job.location; ignore zip
        }
        
        else if(job.type == "pickup" || job.type == "delivery") {
          tasks[counter] = {};
          if("description" in job){
            tasks[counter]['description'] = job.description + "(" + job.type + ")";
          }
          tasks[counter]['id'] = job.job;
          tasks[counter]['delivery'] = [1];
          tasks[counter]['location'] = job.location;
          tasks[counter]['service'] = 300;
          // tasks[counter]["description"] = "some street name";
          counter ++;
          // tasks[i]['zip'] = job.location; ignore zip
        }

      });
      // console.log("job counter");
      // console.log(counter);

      // console.log(route);

      // console.log(route.steps);
    });

    // console.log("after 1");
    // tasks[]['id'] = 1;
    // console.log(array);
    // console.log("after 2");

    // console.log("after setouput");

    var combinedData = {};

    // console.log(counter);
    // var arr = [];
    for (var i = 0; i < array.unassigned.length; i++) {
        tasks[counter] = {};
        tasks[counter]['id'] = array.unassigned[i].id ;
        tasks[counter]['delivery'] = [1] ;
        tasks[counter]['location'] = array.unassigned[i].location ;
        tasks[counter]['service'] = 300 ;
        counter++;
    }

    // console.log("arr");
    
    var arr2 = Object.keys(cars).map(function(k) { return cars[k] });
    var arr3 = Object.keys(tasks).map(function(k) { return tasks[k] });
    var arr4 = Object.keys(array.unassigned).map(function(k) { return array.unassigned[k] });
    
    var routes = array.routes;

    combinedData['vehicles'] = arr2;
    combinedData['jobs'] = arr3;
    combinedData['routes'] = routes;
    combinedData['unassigned'] = arr4;

    combinedData['summary'] = array['summary'];

    var inputData={};
    inputData["vehicles"] = arr2;
    inputData["jobs"] = arr3;
    
    // console.log(JSON.parse(combinedData));

    var arr = [];
    // for (var i = 0; i < combinedData.length; i++) {
    //     arr.push(combinedData[i].name);
    // }
    arr.push(combinedData["vehicles"]);
    arr.push(combinedData["jobs"]);
    // arr.push(combinedData[i].name);

    // console.log("dasdas");

    // var a = JSON.parse(combinedData);

    panelControl.hideInitDiv();

    // if (('output' in data) && ('code' in data['output'])) {
    //   dataHandler.setSolution(data);
    //   solutionHandler.plotSolution();
    // }

    dataHandler.setData(inputData);
    // console.log("after set");
    dataHandler.setOutput(JSON.parse(jData));
    // dataHandler.setOutput(combinedData);

    // console.log("to print output . . .");
    // console.log(dataHandler.getOutput());
    dataHandler.closeAllPopups();
    dataHandler.checkControls();
    dataHandler.fitView();
    //console.log(dataHandler.getOutput);

    // dataHandler.setSolution(JSON.parse(event.target.result));
    // solutionHandler.plotSolution();

    // console.log("start plot");

    var result = combinedData;
    // console.log(result);
    // if (result['code'] !== 0) {
    //   console.log("error");
    //   alert(result['error']);
    //   return;
    // }
    // console.log("start plot2");
    // console.log(result.unassigned);
    // console.log(result.routes);
  
    // console.log(result);
    dataHandler.markUnassigned(result.unassigned);
    // console.log("1");
  
    // dataHandler.addGeometries(result.routes);
    // console.log("geometries");
  
    dataHandler.addRoutes(routes);
    // console.log("2");
  
    dataHandler.checkControls();
    // console.log("3");

    var summaryControl = require('../controls/summary');
    summaryControl.update(result);
}

readerGeo.onload = function(event) {
  // We first try parsing the input to determine if the file contains
  // a valid json object with the expected keys.
  var validJsonInput = true;
  try {


    // var data = JSON.parse(event.target.result);
    // validJsonInput = ('jobs' in data) && ('vehicles' in data);
    // console.log("loaded2");
    //console.log(JSON.parse(event.target.result));

    var data = event.target.result;
    // dataHandler.setOutput(JSON.parse(event.target.result));
    
    var cars = {};
    var counter = 0;
    var tasks = {};
    // jobList.append(Job(x+1,[1],[pickupDeliveryMorning.iloc[x]["lgtd"], pickupDeliveryMorning.iloc[x]["lat"]] , [pickupDeliveryMorning.iloc[x]["zip"]], [] ))
    var array = JSON.parse(event.target.result);
    array.routes.forEach(function(route, i) {
      // console.log(entry);
      cars[i] = {};
      cars[i]['id'] = route.vehicle;
      cars[i]['start'] = route.steps[0]['location'];
      cars[i]['end'] = route.steps[0]['location'];
      cars[i]['capacity'] = 99999;
      cars[i]['time_window'] = [0, 14400]
      if("name" in route.steps[0]){
        // console.log("received");
        cars[i]['name'] = route.steps[0].name;
      }
      
      route.steps.forEach(function(job) {
        // counter = 1;
        if(job.type == "job") {
          tasks[counter] = {};
          if("description" in job){
            tasks[counter]['description'] = job.description;
          }
          tasks[counter]['id'] = job.job;
          tasks[counter]['delivery'] = [1];
          tasks[counter]['location'] = job.location;
          tasks[counter]['service'] = 300;
          // tasks[counter]["description"] = "some street name";
          counter ++;
          // tasks[i]['zip'] = job.location; ignore zip
        }
      });
      // console.log(route);

      // console.log(route.steps);
    });

    // console.log("after 1");
    // tasks[]['id'] = 1;
    // console.log(array);
    // console.log("after 2");

    // console.log("after setouput");

    var combinedData = {};

    console.log(counter);
    // var arr = [];
    for (var i = 0; i < array.unassigned.length; i++) {
        tasks[counter] = {};
        tasks[counter]['id'] = array.unassigned[i].id ;
        tasks[counter]['delivery'] = [1] ;
        tasks[counter]['location'] = array.unassigned[i].location ;
        tasks[counter]['service'] = 300 ;
        counter++;
    }

    // console.log("arr");
    
    var arr2 = Object.keys(cars).map(function(k) { return cars[k] });
    var arr3 = Object.keys(tasks).map(function(k) { return tasks[k] });
    // var arr4 = Object.keys(array.unassigned).map(function(k) { return array.unassigned[k] });
    
    var routes = array.routes;

    combinedData['vehicles'] = arr2;
    combinedData['jobs'] = arr3;
    combinedData['routes'] = routes;
    // combinedData['unassigned'] = arr4;

    combinedData['summary'] = array['summary'];

    var inputData={};
    inputData["vehicles"] = arr2;
    inputData["jobs"] = arr3;

    // console.log(JSON.parse(combinedData));

    var arr = [];
    // for (var i = 0; i < combinedData.length; i++) {
    //     arr.push(combinedData[i].name);
    // }
    arr.push(combinedData["vehicles"]);
    arr.push(combinedData["jobs"]);
    // arr.push(combinedData[i].name);

    // console.log("dasdas");

    // var a = JSON.parse(combinedData);

    panelControl.hideInitDiv();

    // if (('output' in data) && ('code' in data['output'])) {
    //   dataHandler.setSolution(data);
    //   solutionHandler.plotSolution();
    // }

    dataHandler.setData(inputData);
    // console.log("after set");
    dataHandler.setOutput(JSON.parse(event.target.result));
    // dataHandler.setOutput(combinedData);

    // console.log("to print output . . .");
    // console.log(dataHandler.getOutput());
    dataHandler.closeAllPopups();
    dataHandler.checkControls();
    dataHandler.fitView();
    //console.log(dataHandler.getOutput);

    // dataHandler.setSolution(JSON.parse(event.target.result));
    // solutionHandler.plotSolution();

    // console.log("start plot");

    var result = combinedData;
    // console.log(result);
    // if (result['code'] !== 0) {
    //   console.log("error");
    //   alert(result['error']);
    //   return;
    // }
    // console.log("start plot2");
    // console.log(result.unassigned);
    // console.log(result.routes);
  
    // console.log(result);
    dataHandler.markUnassigned(result.unassigned);
    // console.log("1");
  
    // dataHandler.addGeometries(result.routes);
    // console.log("geometries");
  
    dataHandler.addRoutes(routes);
    // console.log("2");
  
    dataHandler.checkControls();
    // console.log("3");

    var summaryControl = require('../controls/summary');
    summaryControl.update(result);

  } catch(e) {
    // console.log("error !!!");
    // console.log(e);
  }

  if (validJsonInput) {
    // console.log("valid json");
    // panelControl.hideInitDiv();
    // dataHandler.setData(inputData);
    // dataHandler.closeAllPopups();
    // dataHandler.checkControls();

    // console.log(readerGeo.result);
    // dataHandler.setOutput(readerGeo.result);
    // solutionHandler.plotSolution();
    
    // // Plot solution if current file contains one.
    // if (('output' in data) && ('code' in data['output'])) {
    //   console.log("start plot solution checking");
    //   dataHandler.setSolution(data);
    //   solutionHandler.plotSolution();
    // }

    // dataHandler.fitView();
  } else {

    // var xhttp = new XMLHttpRequest();
    // dataHandler.setOutput(JSON.parse(xhttp.response));
    // console.log("parsing file");
    // solutionHandler.plotSolution();


    // Start line by line parsing.

    // var lines = event.target.result.split("\n");

    // // Strip blank lines from file.
    // while (lines.indexOf("") > -1) {
    //   lines.splice(lines.indexOf(""), 1);
    // }

    // // Used to report after parsing the whole file.
    // var context = {
    //   locNumber: 0,
    //   // The '1 +' accounts for the first job being actually the
    //   // start/end.
    //   targetLocNumber: Math.min(lines.length, 1 + api.maxJobNumber),
    //   totalLocNumber: lines.length,
    //   unfoundLocs: []
    // };


  }
};


reader.onerror = function(event) {
  alert("File could not be read! Code " + event.target.error.code);
};
reader.onload = function(event) {
  // We first try parsing the input to determine if the file contains
  // a valid json object with the expected keys.
  var validJsonInput = false;
  try {
    var data = JSON.parse(event.target.result);
    validJsonInput = ('jobs' in data) && ('vehicles' in data);
  } catch(e) {}

  if (validJsonInput) {
    panelControl.hideInitDiv();
    dataHandler.setData(data);
    console.log(data);
    dataHandler.closeAllPopups();
    dataHandler.checkControls();

    // Plot solution if current file contains one.
    if (('output' in data) && ('code' in data['output'])) {
      dataHandler.setSolution(data);
      solutionHandler.plotSolution();
    }

    dataHandler.fitView();
  } else {
    // Start line by line parsing.
    var lines = event.target.result.split("\n");

    // Strip blank lines from file.
    while (lines.indexOf("") > -1) {
      lines.splice(lines.indexOf(""), 1);
    }

    // Used to report after parsing the whole file.
    var context = {
      locNumber: 0,
      // The '1 +' accounts for the first job being actually the
      // start/end.
      targetLocNumber: Math.min(lines.length, 1 + api.maxJobNumber),
      totalLocNumber: lines.length,
      unfoundLocs: []
    };

    for (var i = 0; i < context.targetLocNumber; ++i) {
      _batchGeocodeAdd(lines[i], context);
    }
  }
};

var _batchGeocodeAdd = function(query, context) {
  geocoder.defaultGeocoder.geocode(query, function(results) {
    context.locNumber += 1;
    var r = results[0];
    if (r) {
      locationHandler.addPlace(r.center,
                               address.display(r));
    } else {
      context.unfoundLocs.push(query);
    }
    if (context.locNumber === context.targetLocNumber) {
      // Last location have been tried.
      var msg = '';
      if (context.targetLocNumber < context.totalLocNumber) {
        msg += 'Warning: only the first '
          + context.targetLocNumber
          + ' locations where used.\n';
      }
      if (context.unfoundLocs.length > 0) {
        msg += 'Unfound location(s):\n';
        for (var i = 0; i < context.unfoundLocs.length; ++i) {
          msg += '- ' + context.unfoundLocs[i] + '\n';
        }
      }
      dataHandler.fitView();

      if (msg.length > 0) {
        alert(msg);
      }
    }
  }, context);
};

var setFile = function() {
  // var fileInput = document.getElementById('user-file');
  // fileInput.addEventListener("change", function(event) {
  //   reader.readAsText(fileInput.files[0]);
  // }, false);
}

//extra 
var setGeoFile = function() {
  // var fileInput = document.getElementById('geo-file');
  // fileInput.addEventListener("change", function(event) {
  //   readerGeo.readAsText(fileInput.files[0]);
  // }, false);
}

module.exports = {
  setFile: setFile,
  setGeoFile: setGeoFile,
  loadJsonWithData: loadJsonWithData,
  loadJsonWithData2: loadJsonWithData2
};

