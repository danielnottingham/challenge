require 'rails_helper'

RSpec.describe "Orders", type: :system do
  describe "#index" do
    context "when there are no records" do
      it "displays page title and order's table" do
        user = sign_in
        visit orders_path

        expect(page).to have_css("h3", text: "Corridas")
        expect(page).to have_css("table")
        expect(page).to have_css("th", text: "ID Usuário")
        expect(page).to have_css("th", text: "Local de Partida")
        expect(page).to have_css("th", text: "Local de Destino")
        expect(page).to have_css("th", text: "Horário")
        expect(page).to have_css("th", text: "Valor Estimado")
        expect(page).to have_css("tbody tr", count: 0)
      end
    end

    context "when there are records" do
      it "displays page title and users orders" do
        user = sign_in
        orders = create_list(:order, 5, user_id: user.id)

        visit orders_path

        expect(page).to have_css("h3", text: "Corridas")
        expect(page).to have_css("table")
        expect(page).to have_css("th", text: "ID Usuário")
        expect(page).to have_css("th", text: "Local de Partida")
        expect(page).to have_css("th", text: "Local de Destino")
        expect(page).to have_css("th", text: "Horário")
        expect(page).to have_css("th", text: "Valor Estimado")
        expect(page).to have_css("tbody tr", count: 5)
        orders.each do |order|
          expect(page).to have_css("tr#order_#{order.id}")
        end
      end
    end
  end

  describe "#new" do
    it "displays page title and form" do
      user = sign_in
      visit orders_path
      click_link "Nova Corrida"

      expect(page).to have_css("h3", text: "Nova Corrida")
      expect(page).to have_field("order_starting_point")
      expect(page).to have_field("order_ending_point")
      expect(page).to have_field("order_request_time")
      expect(page).to have_field("order_estimated_value_cents")
      expect(page).to have_button("Cadastrar")
    end
  end

  describe "#create" do
    context "with valid form" do
      it "creates a new order" do
        user = sign_in
        visit orders_path
        click_link "Nova Corrida"

        expect(page).to have_css("h3", text: "Nova Corrida")

        fill_in "Local de partida", with: "Av. Godofredo Maciel, 2900"
        fill_in "Local de chegada", with: "Av. Oliveira Paiva, 1200"
        fill_in "Horário", with: "12:00"
        fill_in "Valor estimado", with: "5000"

        click_button "Cadastrar"

        expect(page).to have_css("h3", text: "Corridas")
        expect(page).to have_content("A Corrida foi criada com sucesso!")
        expect(page).to have_css("tbody tr", count: 1)
      end
    end

    context "with invalid form" do
      it "displays errors" do
        user = sign_in
        visit orders_path
        click_link "Nova Corrida"

        expect(page).to have_css("h3", text: "Nova Corrida")

        click_button "Cadastrar"

        expect(page).to have_css("h2", text: "erros proibiram que esta corrida fosse salva:")
        expect(page).to have_css("li", text: "Local de partida não pode ficar em branco")
        expect(page).to have_css("li", text: "Local de chegada não pode ficar em branco")
        expect(page).to have_css("li", text: "Horário não pode ficar em branco")
        expect(page).to have_css("li", text: "Valor estimado não pode ficar em branco")
        expect(page).to have_css("li", text: "Valor estimado não é um número")
      end
    end
  end
end
