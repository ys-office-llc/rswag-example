class Api::V1::TodosController < ApplicationController
  def index
    todos = [{ name: "歯磨き", done: false }, { name: "掃除", done: true }]
    render json: todos
  end
end
