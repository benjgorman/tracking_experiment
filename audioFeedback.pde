import toxi.audio.*;
import toxi.geom.*;

import java.nio.*;

import toxi.math.waves.*;
import toxi.math.*;

float x =30.0f;
float y =0.0f;
float z =0.0f;

JOALUtil audioSys;
AudioSource source, new_source, below_source;

SoundListener listener;

boolean is_above_playing =false;
boolean is_below_playing = false;

int SAMPLE_FREQ=41000;
private float xLis, yLis, zLis; // current position
private float[] oriLis; // orientation
AudioBuffer buffer, new_buffer;

public void audioSetup()
{
  // JOALUtil is implemented as singleton, so get an instance like this & initialize it
  audioSys = JOALUtil.getInstance();
  audioSys.init();
  
  float[] sample=new float[SAMPLE_FREQ*4];
  // calculate the base frequency in radians
  float freq=AbstractWave.hertzToRadians(30,SAMPLE_FREQ);
  // create an oscillator for the left channel
  AbstractWave osc=new SineWave(1,freq,0.2,0);

  for(int i=0; i<sample.length; i+=2) {
    sample[i]=osc.update();
    sample[i+1]=osc.update();
  }
  
  // convert raw signal into JOAL 16bit stereo buffer
  buffer=SynthUtil.floatArrayTo16bitStereoBuffer(audioSys,sample,SAMPLE_FREQ);
  // create a sound source, enable looping & play it
  new_source=audioSys.generateSource();
  new_source.setBuffer(buffer);
  new_source.setLooping(true);
  //new_source.play();
  
  sample=new float[SAMPLE_FREQ*4];
  // calculate the base frequency in radians
  freq=AbstractWave.hertzToRadians(200,SAMPLE_FREQ);
  // create an oscillator for the left channel
  osc=new SineWave(1,freq,0.2,0);

  for(int i=0; i<sample.length; i+=2) {
    sample[i]=osc.update();
    sample[i+1]=osc.update();
  }
  
  // convert raw signal into JOAL 16bit stereo buffer
  new_buffer=SynthUtil.floatArrayTo16bitStereoBuffer(audioSys,sample,SAMPLE_FREQ);
  // create a sound source, enable looping & play it
  below_source=audioSys.generateSource();
  below_source.setBuffer(new_buffer);
  below_source.setLooping(true);
  //new_source.play();
  
  
  
  listener = audioSys.getListener();
  initListener();
  initSource();
}

public void initSource_Y()
{
  
}

public void initSourceAbove()
{
  new_source.play();
}

public void initSource()
{
  source = audioSys.generateSourceFromFile(dataPath("3.wav"));
  source.setPosition(x, y, z);
  source.setVelocity(0.0f, 0.0f, 0.0f);
  source.setReferenceDistance(40.0f);
  
}

public void initListener() //position and orientate the listener
{
  xLis = 0.0f; yLis = 0.0f; zLis = 0.0f;
  listener.setPosition(xLis, yLis, zLis);
  listener.setVelocity(0, 0, 0);
  listener.updatePosition();
  
  oriLis = new float[] {xLis, yLis, zLis-1.0f, 0.0f, 1.0f, 0.0f};
  /* the first 3 elements are the "look at" point,
  the second 3 are the "up direction" */
  listener.setOrientation(oriLis);
  
}


public void audioDirection(int direction)
{
  println("Audio Direction:" + direction);
  switch(direction)
  {
    case withinTarget_X:
      withinTarget_X_Audio();
      break;
      
    case withinTarget_Y:
      withinTarget_Y_Audio();
      break;
      
    case rightOfTarget:
     rightOfTarget_Audio();
     break;
     
    case leftOfTarget:
      leftOfTarget_Audio();
      break;
      
    case aboveTarget:
      above_Target_Audio();
      break;
      
    case belowTarget:
      below_Target_Audio();
      break;
  }
  
}

public void withinTarget_X_Audio()
{
  x = 0;
  source.setPosition(x, y, z);
  
  
  if (count == 0)
  {
    //source.play();
    count = -2;
  }
  else
  {
    count++;
  }
}

int count = 0;
public void rightOfTarget_Audio()
{
  x = -30.0f;
  source.setPosition(x, y, z);
  //source.updatePosition();
  
  if (count == 0)
  {
    source.play();
    count = -10;
  }
  else
  {
    count++;
  }
}

public void leftOfTarget_Audio()
{
  x = 30.0f;
  source.setPosition(x, y, z);
  //source.updatePosition();
  
  if (count == 0)
  {
    source.play();
    count = -10;
  }
  else
  {
    count++;
  }
}

public void withinTarget_Y_Audio()
{
    if (is_above_playing == true)
    {
      is_above_playing = false;
      new_source.stop();
    }
    
    if (is_below_playing == true)
    {
      is_below_playing = false;
      below_source.stop();
    }
  
}

public void above_Target_Audio()
{
  if (is_below_playing == false)
  { 
    if (is_above_playing == true)
    {
      new_source.stop();
    }
    is_above_playing = false;
    below_source.play();
    is_below_playing = true;
  }
  else
  {
    return;
  }
}

public void below_Target_Audio()
{
  if (is_above_playing == false)
  {
    if (is_below_playing == true)
    {
      below_source.stop();
    }
    
    is_below_playing = false;
    new_source.play();
    is_above_playing = true;
  }
  else
  {
    return;
  }
}
