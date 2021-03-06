
Dado("que estou na tela inicial") do
    visit 'http://cadastrodigital.cedrotech.com/cadastro/basic-information'
  
  end

Quando("eu preencher os campos obrigatórios") do |table|
 ##Todo Verificar como o capybara utiliza os métodos dentro de classes
 
 Login.new.cadastraUsuario(table)

    #  @data = table.hashes
    #     @data.each do |valor|
    #         @login=valor['Nome']
    #         @cpf= valor['Cpf'].to_i
    #         @email=valor['Email']
    #         @celular=valor['Celular']
    #         @objetivo=valor['Objetivo']
    #        login_form
    #         if @objetivo=="cambio"
    #             click_on(id: 'reason2')
    #         else @objetivo=="investimento"
    #         click_button("reason1")
    #         end  
    #     end

  end


  Quando("eu clicar em Seguir") do
    click_button("buttonNext")    
       
  end
#Todo Implementar o httpparty  
#   Quando("o Serviço de validação de usuário retornar sucesso") do
#     pending # Write code here that turns the phrase above into concrete actions
#   end
  
  Então("o sistema direciona para a tela de seleção de plano") do
   expect(page).to have_css(".title-content", text: "ESCOLHA UM PLANO")
    
  end
  
  Então("o sistema direciona para a tela de informações pessoais") do
    expect(page).to have_css(".title-content", text: "INFORMAÇÕES PESSOAIS")
  end
  
  Quando("eu preencher os campos obrigatórios com cpf e email já cadastrados") do |table|
    Login.new.cadastraUsuario(table,true)
  end
  
  Então("o sistema Exibe a mensagem informando que o usuário já está cadastrado") do
    expect(page).to have_css(".message-modal", text: "O CPF informado já consta em nossa base de dados, por favor, entrar em contato com a área de cadastro.")
  end