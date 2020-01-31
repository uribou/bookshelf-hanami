module Web
  module Controllers
    module Books
      class Create
        include Web::Action

        expose :book

        params do
          required(:book).schema do
            required(:title).filled(:str?)
            required(:author).filled(:str?)
          end
        end

        def call(params)
          if !params.valid?
            self.status = 422
            return
          end

          BookRepository.new.create(params[:book])

          redirect_to routes.books_path
        end
      end
    end
  end
end
