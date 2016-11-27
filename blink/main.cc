#include <stdint.h>

#define RCC                 (0x40023800)
#define RCC_AHB1ENR         ((volatile uint32_t *)(RCC + 0x30))
#define RCC_AHB1ENR_GPIOD   (1 << 3)

#define GPIOD               (0x40020C00)
#define GPIOD_MODER         ((volatile uint32_t *)(GPIOD + 0x0))
#define GPIOD_MODER_OUT     (1)
#define GPIOD_ODR           ((volatile uint32_t *)(GPIOD + 0x14))

int main(void) {
    // Enable GPIOD
    *RCC_AHB1ENR |= RCC_AHB1ENR_GPIOD;

    // PD12 to output
    *GPIOD_MODER |= (GPIOD_MODER_OUT << 2*12);

    while (1) {
        // Toggle LED
        *GPIOD_ODR ^= (1 << 12);

        int i = 1000000;
        while (i--);
    }
}
