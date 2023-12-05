http://codientu.info/threads/6507-Bai-4-Ngat-ngoai-cua-STM8S003.html


Chào mọi người.
Hôm nay mình xin trình bày 1 số thông tin cơ bản về ngắt ngoài của STM8s003. Tất cả các chân của STM8s003 đều có thể cấu hình là ngắt ngoài:
GPIO_Init(GPIOA, GPIO_PIN_1, GPIO_MODE_IN_PU_IT); // chân PA1 là chân vào, trở kéo lên và có ngắt ngoài
GPIO_Init(GPIOA, GPIO_PIN_1,GPIO_MODE_IN_FL_IT);// chân PA1 là chân vào , thả nổi và có ngắt ngoài.
Để cài đặt cho 1 chân nào đó có chức năng ngắt thì thứ tự là:
--cấu hình chân đó là ngắt.
GPIO_Init(GPIOA, GPIO_PIN_1, GPIO_MODE_IN_PU_IT); // chân PA1 là chân vào, trở kéo lên và có ngắt ngoài
--chọn chế độ ngắt sườn lên, xuống, hay mức, hoặc cả sườn lên và xuống.
EXTI_SetExtIntSensitivity(EXTI_PORT_GPIOA, EXTI_SENSITIVITY_FALL_ONLY);// chỉ cho phép ngắt sườn xuống ở cổng Pa
Đây là tất cả các lựa chọn khác:
EXTI_SENSITIVITY_FALL_LOW = (uint8_t)0x00, /*!< ngắt sườn xuống và mức thấp */
EXTI_SENSITIVITY_RISE_ONLY = (uint8_t)0x01, /*!< chỉ sườn lên */
EXTI_SENSITIVITY_FALL_ONLY = (uint8_t)0x02, /*!< chỉ sườn xuống */
EXTI_SENSITIVITY_RISE_FALL = (uint8_t)0x03 /*!< cả sườn lên và xuống */
--cho phép ngắt toàn cục.
enableInterrupts();
--Viết chương trình phục vụ ngắt tương ứng.
INTERRUPT_HANDLER(EXTI_PORTA_IRQHandler, 3)
{
/* In order to detect unexpected events during development,
it is recommended to set a breakpoint on the following instruction.
*/
if (((GPIOA->IDR & INPUT))==0)
giai_ma();
else if (((PORT_KEY_1->IDR & KEY_1))==0)
Key_1();
else if (((PORT_KEY_2->IDR & KEY_2))==0)
Key_2();
}

Ở STM8S thì cũng như ở MSP430: mối cổng chỉ có 1 vecto ngắt dùng cho tất cả các chân của cổng đó, đâm ra nếu có nhiều chân ngắt thì cũng chỉ có 1 chương trình phục vụ ngắt mà thôi. Khi ngắt thì không có cờ nào được bật,
do đó không cần xóa cờ ở cuối chương trình phục vụ ngắt, nếu có nhiều hơn 2 chân của 1 cổng được cho ngắt thì chúng ta chỉ có thể biết được chân nào đã ngắt bằng cách kiểm tra mức của chân đó trong chương trình ngắt.
if (((GPIOA->IDR & GPIO_PIN_1))==0) giai_ma(); // nếu chân Pa1 = 0 thì giai_ma();

Khi chế độ ngắt được chọn cho 1 cổng( chẳng hạn ngắt sườn lên) thì tất cả các chân trong cổng đó đều ngắt sườn lên nếu chúng được cho phép ngắt. Nói tóm lại mỗi cổng chỉ được phép chọn 1 chế độ ngắt cho tất cả các chân.

Thư viện cho ngắt ngoài của stm8s là stm8s_exti.h ,tất cả các chương trình phục vụ ngắt được lưu trong stm8s_it.c.

Ngắt ngoài của stm8s có thể đánh thức cpu từ chế độ ngủ hay giảm nguồn. Để quan sát các thanh ghi của ngắt ngoài khi debug trên IAR thì ta chọn View/register/ITC.

Reset được cho là 1 ngắt ngoài của STM8s, nếu không cấu hình chế độ ngắt bằng hàm EXTI_SetExtIntSensitivity(...) thì mặc định là ngắt sườn xuống và mức thấp.
