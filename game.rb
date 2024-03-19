class Game

  def initialize()
    @current_player = true
    @game_status = true

    puts "Welcome to TwO-O-Player-Math-Game"
    print "Player 1, Enter your name: "
		player1 = $stdin.gets.chomp

		print "Player 2, Enter your name: "
		player2 = $stdin.gets.chomp

		@player1 = Player.new(player1)
    @player2 = Player.new(player2)

    new_game()
  end

  def new_game()
    while @game_status == true

      if @current_player == true
        question(@player1)
      else
        question(@player2)
      end

      if @game_status == false
        if @player1.lives == 0
          puts "---------- GAME OVER ----------"
          puts "#{@player2.name} wins!"
        else
          puts "---------- GAME OVER ----------"
          puts "#{@player1.name} wins!"
        end
      else
        puts "---------- NEW TURN ----------"
        @current_player = !@current_player
      end
    end    
  end

  def question(player)
    @number1 = rand(1..20)
    @number2 = rand(1..20)
    @answer = @number1 + @number2
   
    puts "#{player.name}: What is #{@number1} plus #{@number2}?"

    #player answer typed into command line:
    @player_answer = $stdin.gets.chomp

    if @player_answer.to_i == @answer
      puts "#{player.name}: You are correct! :) "
      puts "Current Score: #{@player1.name} - #{@player1.lives}/3 VS #{@player2.name} ; #{@player2.lives}/3"
    else
      puts "#{player.name}: You are incorrect :( "
      player.lives -= 1
      puts "Current Score: #{@player1.name} - #{@player1.lives}/3 VS #{@player2.name} - #{@player2.lives}/3"
    end

    if player.lives  == 0
      @game_status = false
    end
  end
  
end
