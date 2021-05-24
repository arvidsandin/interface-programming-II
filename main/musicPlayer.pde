/*
 * A class for handling the the music
 */
 class MusicPlayer{
  SoundFile[] tracks;
  int currentTrack;
  boolean isReady = false;
  boolean isPlaying = !muteGame;

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
      tracks[currentTrack].stop();
    }
  }

  /*
   * pause the current track
   *
   * @return None
   */
  void pause(){
    if (isReady){
      tracks[currentTrack].pause();
      isPlaying = false;
    }
  }

  /*
   * start playing the current track from the beginning on a loop
   *
   * @return None
   */
  void loopCurrent(){
    // Global variable sets track to loop
    currentTrack = selectedSong;
    if (isReady && !muteGame){
      this.stop_playing();
      tracks[currentTrack].loop();
      isPlaying = true;
    if (isReady && !muteGame){
      this.stop_playing();
      tracks[currentTrack].loop();
    }
  }

  /*
   * start playing a random track from the beginning on a loop
   *
   * @return None
   */
  void loop_random(){
    if (isReady && !muteGame){
      this.stop_playing();
      Random r = new Random();
      currentTrack = r.nextInt(tracks.length);
      tracks[currentTrack].loop();
      isPlaying = true;
    }
  }

  /*
   * start playing a specified track from the beginning on a loop
   *
   * @return None
   */
  void loopTrack(int trackNumber){
    if (isReady && !muteGame){
      this.stop_playing();
      currentTrack = trackNumber;
      tracks[currentTrack].loop();
      isPlaying = true;
    }
  }

  /*
   * start playing a specified track from where it was paused, or the beginning if it has not been paused
   *
   * @return None
   */
  void playTrack(int trackNumber){
    if (isReady && !muteGame){
      this.stop_playing();
      currentTrack = trackNumber;
      tracks[currentTrack].play();
      isPlaying = true;
    }
  }
  
  /*
   * Stops playing a specified track if it is running
   *
   * @return None
   */
  void stopTrack(int trackNumber){
      this.stop_playing();
      currentTrack = trackNumber;
      tracks[currentTrack].play();
      isPlaying = false;
  }
  
  boolean isPlaying(){
    return isPlaying;
  }
}
