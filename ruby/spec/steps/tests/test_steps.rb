# encoding: utf-8

steps_for :common do
  step 'googleを訪問' do
    url = "http://www.google.com"
    visit url
  end

  step 'googleのページが表示されている' do
    expect(page).to have_content("Google.com")
  end

  step '「長谷川豊」で検索する' do
    within("form") do
      fill_in "q", with: "長谷川豊"
    end
  end

  step '処理を待つ' do
    sleep 5
  end

  step '検索結果のページが表示されている' do
    expect(page).to have_content("長谷川豊")
  end
end
