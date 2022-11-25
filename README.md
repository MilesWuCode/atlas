```sh
https://github.com/ariga/atlas/releases
chmod +x ./main
sudo mv ./main /usr/local/bin/atlas
sudo chown root: /usr/local/bin/atlas

# example 專案資料庫
# test 空資料庫用於比較

# 取得
atlas schema inspect -u "mysql://root:password@localhost:3306/example" > schema.hcl

# 更新
atlas schema apply \
  -u "mysql://root:password@localhost:3306/example" \
  -f schema.hcl

# 比較
atlas migrate diff create_users \
  --dir="file://migrations" \
  --to="file://schema.hcl" \
  --dev-url="mysql://root:password@:3306/test"

# 檢查SQL伺服器
atlas schema inspect -u "mysql://root:password@localhost:3306"

# 生成up/down
atlas migrate diff create_users \
  --dir="file://migrations?format=golang-migrate" \
  --to="file://schema.hcl" \
  --dev-url="mysql://root:password@:3306/test"

# 使用env方式:atlas.hcl
atlas schema apply --env local
atlas migrate diff --env local
atlas migrate validate --env local
```
