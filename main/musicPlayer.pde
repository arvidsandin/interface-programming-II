/*
 * A class for handling the the music
 */
 class MusicPlayer{
  SoundFile[] tracks;
  int isPlaying;
  boolean isReady = false;
  main m;

  /***************************************************************************************************************************************************
  *  MODEL
  ***************************************************************************************************************************************************
  */
  MusicPlayer(main main){
    this.m = main;
  }

  /*
   * load all the audio files, necessary to run before playing them
   *
   * @return None
   */
  void loadFiles(){
    tracks = new SoundFile[2];
    tracks[0] = new SoundFile(m, "data/audio/bensound-house.mp3");
    tracks[1] = new SoundFile(m, "data/audio/bensound-endlessmotion.mp3");
    isReady = true;
  }

  /*
   * stop playing the current track
   *
   * @return None
   */
  void stop_playing(){
    if (isReady){
      tracks[isPlaying].stop();
    }
  }

  /*
   * pause the current track
   *
   * @return None
   */
  void pause(){
    if (isReady){
      tracks[isPlaying].pause();
    }
  }

  /*
   * start playing the current track from the beginning on a loop
   *
   * @return None
   */
  void loopCurrent(){
    if (isReady){
      this.stop_playing();
      tracks[isPlaying].loop();
    }
  }

  /*
   * start playing a random track from the beginning on a loop
   *
   * @return None
   */
  void loop_random(){
    if (isReady){
      this.stop_playing();
      Random r = new Random();
      isPlaying = r.nextInt(tracks.length);
      tracks[isPlaying].loop();
    }
  }

  /*
   * start playing a specified track from the beginning on a loop
   *
   * @return None
   */
  void loopTrack(int trackNumber){
    if (isReady){
      this.stop_playing();
      isPlaying = trackNumber;
      tracks[isPlaying].loop();
    }
  }

  /*
   * start playing a specified track from where it was paused, or the beginning if it has not been paused
   *
   * @return None
   */
  void playTrack(int trackNumber){
    if (isReady){
      this.stop_playing();
      isPlaying = trackNumber;
      tracks[isPlaying].play();
    }
  }
}
