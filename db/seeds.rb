User.create!(nickname: 'スーパーAAA管理者',
             email: 'admin@example.com',
             password: '111aaa',
             password_confirmation: '111aaa',
             admin: 1)

User.create!(nickname: 'Bスーパー管理者',
             email: 'admin2@example.com',
             password: '111aaa',
             password_confirmation: '111aaa',
             admin: 1)

User.create!(nickname: 'taro',
            email: 'taro@example.com',
            password: '111aaa',
            password_confirmation: '111aaa')

User.create!(nickname: 'スーパーAAA一般スタッフ',
            email: 'staff@example.com',
            password: '111aaa',
            password_confirmation: '111aaa',
            admin: 2)