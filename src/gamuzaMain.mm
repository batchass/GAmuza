//////////////////////////////////////
// GAmuza includes
#include "gamuzaMain.h"

#include "gamuzaKeyboard.h"
#include "gamuzaMouse.h"

#include "gamuzaApp.h"
#include "gamuzaArduino.h"
#include "gamuzaAudio.h"
#include "gamuzaConsole.h"
#include "gamuzaFBO.h"
#include "gamuzaGui.h"
#include "gamuzaMapping.h"
#include "gamuzaMidi.h"
#include "gamuzaOSC.h"
#include "gamuzaPD.h"
#include "gamuzaReceivers.h"
#include "gamuzaScripting.h"

//--------------------------------------------------------------
void gamuzaMain::setup() {

	//////////////////////////////////////////////
    flagSystemLoaded	= false; // first line of gamuza setup
    //////////////////////////////////////////////
    
    
    //////////////////////////////////////////////
	// INIT general OF settings
    ofSetWindowShape(MAIN_WINDOW_W,MAIN_WINDOW_H);
	ofEnableSmoothing();
	ofSetLogLevel(OF_LOG_VERBOSE);
    ofBackground(0);
    //////////////////////////////////////////////
	
    //////////////////////////////////////////////
    // INIT GAmuza CORE
    // set data path inside biundle
    dataInsideBundle();
    // hardware
    retrieveHardwaredata();
    // call the re-init routine
    resetApp();
    //////////////////////////////////////////////
    
    //////////////////////////////////////////////
	// set log level to error only
	ofSetLogLevel(OF_LOG_ERROR);
	//////////////////////////////////////////////
    
    
    //////////////////////////////////////////////
    flagSystemLoaded	= true; // last line of gamuza setup
    //////////////////////////////////////////////
	
	
}

//--------------------------------------------------------------
void gamuzaMain::update() {
    //////////////////////////////////////////////
	// SCRIPTING - LUA -- OF binding
    updateScripting();
    //////////////////////////////////////////////
    
    //////////////////////////////////////////////
	// NET
    updateOSC();
    //////////////////////////////////////////////
    
    //////////////////////////////////////////////
	// MAPPING
    updateMapping();
    //////////////////////////////////////////////
    
    //////////////////////////////////////////////
	// FBO
    updateFBO();
    //////////////////////////////////////////////
    
    //////////////////////////////////////////////
    // ARDUINO
    if(isArduinoConnected && useArduino){
        updateArduino();
    }
    //////////////////////////////////////////////
}

//--------------------------------------------------------------
void gamuzaMain::draw() {

    ofBackground(0,0,0);
    //////////////////////////////////////////////
	// FBO
    drawFBO();
    //////////////////////////////////////////////
    
    //////////////////////////////////////////////
	// MAPPING
    drawMapping();
    //////////////////////////////////////////////
	
}


