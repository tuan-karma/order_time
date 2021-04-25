# OrderTime

Mục đích thí nghiệm

  * So sánh utc_datetime vs naive_datetime từ Ecto lên lớp hiển thị
  * Thử nghiệm nút đặt lệnh (place order) và hiển thị thời gian đặt lệnh so sánh với create_at, update_at ở trong psql


## About DateTime in Elixir/Ecto
  * `:naive_datetime` and `:utc_datetime` seem to be implemented in the same way at DB level (postgres). [Lau's blog about utc-timestamps in Ecto](http://www.creativedeletion.com/2019/06/17/utc-timestamps-in-ecto.html). It can be tested by change the datatype of field in migration file to :naive_datetime but keep it utc_datetime in schema file, the result not change.
  * [Schema configuration for using `:utc_datetime` and more](https://stackoverflow.com/questions/58206597/how-to-set-datetime-in-ecto-schemas-and-timestamp-with-time-zone-timestamp)

## Kết luận
  * Nên dùng `utc_datetime` hoặc `utc_datetime_usec` cho tất cả các bảng migration trong DB và trên schema tương ứng. Trường hợp sau `usec` là microsecond nên dùng cho những app có giao dịch tần số cao.
  * Nên viết một cái module MyApp.Schema riêng trong `my_app/shema.ex` như trong ví dụ `lib/order_time/schema.ex` trong đó xác định UUIDs và utc_datetime cho @primary_key và @timestamps_opts, dùng chung cho tất cả các module schema trong app. Thay vì `use Ecto.Schema` thì `use MyApp.Schema` trong các module schema tương ứng.
  * Về hiển thị Timezone tương ứng tại local: Dùng javascript đọc ra local timezone và hiển thị tương ứng. Thời gian từ server đẩy lên là utc_datetime được convert thành unix time `DateTime.to_unix(utc_datetime)` là ra. Xem ví dụ trong file `lib/order_time_web/templates/order/show.html.eex`
  * Về mặt trình bày: thêm class: "button button-orange button-outline" vào các thẻ <span><%= link to%></span> để tạo hiệu ứng nút bấm, như xem trong ví dụ file `lib/order_time_web/templates/order/index.html.eex`
