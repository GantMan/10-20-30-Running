class HomeScreen < PM::Screen
  include HomeStyles

  title "Timer"

  def on_load
    set_nav_bar_button :left, title: "Settings", action: :settings_tapped
    set_nav_bar_button :right, title: "Help", action: :help_tapped
    @cycle_manager = CycleManager.new
    draw_blocks 1
    draw_seconds 0
    play_sound
  end

  def will_appear
    @view_setup ||= self.set_up_view
  end

  def set_up_view
    set_attributes self.view, :home_view_style

    title = add FBBitmapFontView.new, :title_label_style
    text_label = add UILabel.new, :label_view_style
    @seg = add UISegmentedControl.bar(["Start","Stop"]), :segment_style
    @underline = add UIImageView.alloc.initWithImage('underline-1'.uiimage), :underline_image_style

    @seg.on(:change) {
      ap "Touched! #{@seg.titleForSegmentAtIndex @seg.selectedSegmentIndex}"
      case @seg.selectedSegmentIndex
      when 0 # start
        start_timer
      else # end
        kill_timer
      end
    }
    true
  end

  private

    def start_timer
      @timer = 500.milliseconds.every do
        @time.removeFromSuperview if @time
        @block.removeFromSuperview if @block
        @time = draw_seconds @cycle_manager.tick
        @block = draw_blocks @cycle_manager.block
        draw_underline @cycle_manager.cycle
      end
    end

    def kill_timer
      @timer.invalidate if @timer
      draw_seconds @cycle_manager.cycle_kill
      draw_underline @cycle_manager.cycle
    end

    def settings_tapped
      open_modal SettingsScreen.new(nav_bar: true)
    end

    def help_tapped
      open HelpScreen
    end


    def draw_underline position
      @underline.image = "underline#{position}".uiimage
    end

    def draw_blocks message
      frame = CGRectMake(10, 250, 300, 45)
      b = FBSquareFontView.alloc.initWithFrame(frame)
      b.text = "Block #{message}"
      b.lineWidth = 3.0
      b.lineCap = KCGLineCapRound
      b.lineJoin = KCGLineJoinRound
      b.margin = 12.0
      b.backgroundColor = 0x444444.uicolor
      b.horizontalPadding = 30
      b.verticalPadding = 14
      b.glowSize = 5.0
      b.innerGlowColor = 0x00ffff.uicolor
      b.lineColor = 0xffffff.uicolor
      b.innerGlowSize = 2.0
      b.verticalEdgeLength = 8
      b.horizontalEdgeLength = 10
      self.view.addSubview(b)
      #b.resetSize
      return b
    end

    def draw_seconds message
      frame = CGRectMake(87, 310, 300, 50)
      v = FBLCDFontView.alloc.initWithFrame(frame)
      v.text = "%02d" % message # force leading zeros
      v.lineWidth = 8
      v.drawOffLine = true
      v.edgeLength = 40
      v.margin = 10
      v.backgroundColor = :black.uicolor
      v.horizontalPadding = 30
      v.verticalPadding = 14
      v.glowSize = 10.0
      v.glowColor = 0x00ffff.uicolor
      v.innerGlowColor = 0x00ffff.uicolor
      v.innerGlowSize = 3.0
      self.view.addSubview(v)
      v.resetSize
      return v
    end

    def play_sound

      audioSessionError = Pointer.new(:object)
      audioSession = AVAudioSession.sharedInstance
      if audioSession.setCategory(AVAudioSessionCategoryAmbient, error:audioSessionError)
        ap "Successfully set the audio session"
      else
        ap "Could not set the audio session"
      end

      Dispatch::Queue.concurrent.async do
        mainBundle = NSBundle.mainBundle
        filePath = mainBundle.pathForResource("happy", ofType:"mp3")
        fileData = NSData.dataWithContentsOfFile(filePath)
        error = Pointer.new(:object)

        @audio_player = AVAudioPlayer.alloc.initWithData(fileData, error:error)

        unless (@audio_player.nil?)
          @audio_player.delegate = self
          if (@audio_player.prepareToPlay && @audio_player.play)
            ap "Successfully playing"
          else
            ap "Failed to Play"
          end
        else
          ap "Failed to instantiate AVAudioPlayer"
        end
      end

    end

    def audioPLayerEndInterruption(player)
      if (flags == AVAudioSessionInterruptionFlags_ShouldResume && @audio_player != nil)
        @audio_player.play
      end
    end
end
