class VironController < ApplicationController
  # GET /viron_authtype
  # https://cam-inc.github.io/viron-doc/docs/dev_api_authtype.html
  def viron_authtype
    render json: [
      {
        type: 'email',
        provider: 'viron-example',
        url: '/signin',
        method: 'POST',
      },
      {
        type: 'signout',
        provider: '',
        url: '/signout',
        method: 'POST',
      }
    ].to_json
  end

  # GET /viron
  # https://cam-inc.github.io/viron-doc/docs/dev_api_menu.html
  def viron
    render json: {
      theme: 'standard',
      color: 'white',
      name: 'Viron example - local',
      tags: [],
      thumbnail: '', # サムネイル画像のURLを入れる
      pages: [
        {
          section: 'manage',
          group: 'todo',
          id: 'todo',
          name: 'アイテム',
          components: [
            {
              api: {
                method: 'get',
                path: '/api/v1/todos',
              },
              name: 'アイテム',
              style: 'table',
              primary: 'id',
              pagination: true,
              query: [], # ここを頑張れば絞り込みパラメータもつけられる
              table_labels: [
                'id',
                'name',
              ],
              actions: [],
            },
          ],
        },
      ],
    }.to_json
  end
end
