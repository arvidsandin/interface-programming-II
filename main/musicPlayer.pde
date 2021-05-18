class MusicPlayer{
  SoundFile[] tracks;
  int isPlaying;
  boolean isReady = false;
  main m;

  MusicPlayer(main main){
    this.m = main;
  }

  void loadFiles(){
    tracks = new SoundFile[2];
    tracks[0] = new SoundFile(m, "data/audio/bensound-house.mp3");
    tracks[1] = new SoundFile(m, "data/audio/bensound-endlessmotion.mp3");
    isReady = true;
  }

  void stop_playing(){
    if (isReady){
      tracks[isPlaying].stop();
    }
  }

  void pause(){
    if (isReady){
      tracks[isPlaying].pause();
    }
  }

  void loopCurrent(){
    if (isReady){
      tracks[isPlaying].loop();
    }
  }

  void loop_random(){
    if (isReady){
      this.stop_playing();
      Random r = new Random();
      isPlaying = r.nextInt(tracks.length);
      tracks[isPlaying].loop();
    }
  }
}
