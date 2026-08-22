# Simulação de Airsoft - Efeito Magnus (Godot Engine)

Este projeto é uma simulação física 3D de uma arma de Airsoft disparando BBs (esferas de plástico), focando na aplicação do **Efeito Magnus (Backspin / Hop-up)** na trajetória dos projéteis. O objetivo principal é simular o comportamento de uma BB ao sair do cano de uma arma de airsoft, calculando sua velocidade baseada na energia do disparo e implementando um mecanismo de redução por arrasto o mais realista possível. Desenvolvido no Godot.

## Escolhas de Projeto e Física

* **Velocidade e Energia:** A arma dispara com uma energia fixa de **1.49 Joules**. Usando a equação de energia cinética ($E_c = \frac{m \cdot v^2}{2}$) e a massa de **0.20g (0.0002 kg)** da BB, a velocidade inicial calculada no código é de aproximadamente **122.06 m/s**.
* **Visual vs. Física:** Para que a física seja 100% realista, a massa da BB foi definida como 0.0002 kg e sua colisão (`CollisionShape3D`) tem o raio exato de **3 mm** (0.003 m). Porém, a essa velocidade, uma bolinha de 3 mm fica invisível aos olhos do jogador (ela cruza a tela em uma fração de segundo). Por isso, o **visual da malha (MeshInstance3D) foi aumentado (raio 0.08 e altura 0.16)** para facilitar a visualização e os testes, sem afetar o cálculo físico da colisão e peso.
* **Escala do Efeito Magnus (Hop-up):** A força de sustentação foi implementada usando a fórmula simplificada $\sqrt{v} \times \text{BackspinDrag}$. Como a massa da bolinha é minúscula, qualquer valor alto de força faria a BB voar para o espaço. Para resolver isso e deixar o editor amigável, foi criada uma escala de **0 a 10 no Inspetor**. O código internamente multiplica esse valor por `0.0001` para calibrar a força, permitindo ajustes finos e visuais na trajetória da BB perfeitamente.

## Como testar
1. Abra o projeto no Godot.
2. Na cena principal, execute o jogo (F5).
3. Clique com o botão esquerdo do mouse para atirar.
4. Experimente mudar o valor do `backspin_drag` no nó da BB ou a velocidade na Arma para ver as diferentes trajetórias (Hop-up baixo, ideal e alto).
