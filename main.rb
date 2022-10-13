def da_boas_vindas
	system ("cls")
	puts "\n"
	puts "────(♥)(♥)(♥)────(♥)(♥)(♥) __ 
──(♥)██████(♥)(♥)██████(♥) 
─(♥)████████(♥)████████(♥) BEM VINDO(A) AO...
─(♥)██████████████████(♥) 
──(♥)████████████████(♥)          ╔═══════••••••═══════╗ 
────(♥)████████████(♥) __           JOGO DA AVINHAÇÃO!
──────(♥)████████(♥) 	          ╚═══════••••••═══════╝
────────(♥)████(♥) __ 	
─────────(♥)██(♥) 
───────────(♥) __ "
	puts ""
	puts "\n\n\n"
	puts "Digite o seu nome:"
	nome = gets.strip
	puts "\n\n\n"
	puts "O jogo irá começar, #{nome}"
	puts "\n\n"
	nome
end
def pede_dificuldade
	puts "Escolha um nível de dificuldade"
	puts "❶ - Muito fácil    ❷ - Fácil    ❸ - Normal    ❹ - Difícil    ❺ - Muito difícil"
	dificuldade = gets.to_i
end
def sorteiaNumero (dificuldade)
	case dificuldade
	when 1
		maximo = 30
	when 2
		maximo = 50
	when 3
		maximo = 100
	when 4
		maximo = 150
	else
		maximo = 200
	end
	system ("cls")
	puts "Escolhendo um número entre 1 e #{maximo}..."
	sorteado = rand(maximo) + 1
	puts "\nLoading…
█▒▒▒▒▒▒▒▒▒"
gets
	puts "10%
███▒▒▒▒▒▒▒"
gets
	puts"30%
█████▒▒▒▒▒"
gets
	puts "50%
███████▒▒▒"
gets
	puts "100%
██████████"
gets
	puts "\n\nNúmero escolhido! Tente advinhá-lo!"
	system ("pause")
	sorteado
end
def pedeNumero(chutes, tentativa, limiteDeTentativas)
	system ("cls")
	puts "Tentativa #{tentativa} de #{limiteDeTentativas}"
	puts "\n\n\nVocê já chutou: #{chutes}\n\n"
	puts "Qual o seu chute?"
	chute = gets.strip
	puts "Você chutou: #{chute}"
	chute.to_i
end
def verifica_se_acertou(chute, numero)
	acertou = chute == numero
	if acertou
		system ("cls")
		puts "________0000000000000000________
_____0000000000000000000000_____
__000000000__00000__0000000000__
_0000000000__00000__00000000000_
_0000000000__00000__00000000000_
_000000000000000000000000000000_
_000000000000000000000000000000_
_000000__________________000000_
_000000__________________000000_
__000000_________________00000__
___0000000_____________000000___
_____0000000_________0000000____
_______ 00000000000000000_______\n\n"
		puts "Parabéns! Você acertou!"
		return true
	end
	puts "▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 
████▌▄▌▄▐▐▌█████ 
████▌▄▌▄▐▐▌▀████ 
▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀ \n\n"
	puts "\n\nVish. Você errou!"
	maior = numero > chute
	if maior
		puts "O número é maior!"
		system ("pause")
	else
		puts "O número é menor!"
		system ("pause")
	end
	false
end
def joga(nome, dificuldade)
	numero = sorteiaNumero dificuldade
	pontos_atuais = 1000
	limiteDeTentativas = 5
	chutes = []
	for tentativa in 1..limiteDeTentativas
		chute = pedeNumero chutes, tentativa, limiteDeTentativas
		chutes << chute
		if nome == "Taina"
			system ("cls")
			puts "▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄ 
░░░░ ░░░░▀█▄▀▄▀██████░▀█▄▀▄▀████▀ 
░░░ ░░░░░░░▀█▄█▄███▀░░░▀██▄█▄█\n\n"
			puts "Parabéns! Você acertou!"
			puts "O número era #{chute}"
			puts "Você ganhou #{pontos_atuais} pontos!"
			break
		end
		pontos_perdidos = (chute - numero).abs / 2.0
		pontos_atuais -= pontos_perdidos
		if verifica_se_acertou chute, numero
			break
		end
	end
	if nome != "Taina"
		puts "O número era #{numero}"
		puts "Você ganhou #{pontos_atuais} pontos!"
	end
end
def nao_quer_jogar?
	system ("pause")
	system ("cls")
	puts "+88_________________+880_______
_+880_______________++80_______
_++88______________+880________
_++88_____________++88________
__+880___________++88_________
__+888_________++880__________
__++880_______++880___________
__++888_____+++880____________
__++8888__+++8880++88_________
__+++8888+++8880++8888________
___++888++8888+++888888+80____
___++88++8888++8888888++888___
___++++++888888fx88888888888___
____++++++88888888888888888___
____++++++++000888888888888___
_____+++++++00008f8888888888___
______+++++++00088888888888___
_______+++++++0888f8888888____"
	puts "Deseja jogar novamente? (S/N)"
	quero_jogar = gets.strip
	nao_quero_jogar = quero_jogar.upcase == "N"
end

nome = da_boas_vindas
loop do
	dificuldade = pede_dificuldade
	joga nome, dificuldade
	if nao_quer_jogar?
		break
	end
end
