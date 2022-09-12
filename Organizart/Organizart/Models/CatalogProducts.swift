//
//  ModelTest.swift
//  Organizart
//
//  Created by mccl on 12/09/22.
//

import Foundation

extension Product {
    
    static func logProducts() -> [Product] {
        return [
            Product(
                title: "Planner Peroba",
                description: "Planner para o dia a dia.",
                price: 50.00,
                stock: 3,
                picture: "planner"
                   
            ),
            
            Product(
                title: "Escultura Lira",
                description: "Uma bela escultura para decorar o espaço.",
                price: 40.00,
                stock: 5,
                picture: "escultura"
                   
            ),
            
            Product(
                title: "Bordado Santa Conceição",
                description: "Bordado feito artesanalmente de maneira única e exclusiva.",
                price: 20.00,
                stock: 10,
                picture: "bordado"
                
            ),
            
            Product(
                title: "Ímã Farol de Olinda",
                description: "Ímã perfeito para colocar na geladeira e lembrar de onde você vem.",
                price: 15.00,
                stock: 10,
                picture: "ímã olinda"
                
            ),
            
            Product(
                title: "Robin no Lápis",
                description: "Um lápis divertido para deixar a rotina mais leve!",
                price: 20.00,
                stock: 5,
                picture: "robin no lapis"
                
            ),
            
            Product(
                title: "São Francisco em Madeira 40cm",
                description: "Escultura de São Francisco feita em madeira, ideal para decorar os espaços da casa e lembrar de ter fé sempre.",
                price: 40.00,
                stock: 2,
                picture: "sao francisco em madeira"
                
            ),
            
            Product(
                title: "Ovo Cerâmica",
                description: "Escultura de ovo em cerâmica 50x50cm, colorida e única.",
                price: 20.00,
                stock: 4,
                picture: "ovo em ceramica"
                
            ),
            
            Product(
                title: "Animais na vertical",
                description: "Quadro colorido de animais abstratos.",
                price: 380.90,
                stock: 1,
                picture: "animais na vertical"
                
            ),
            
            Product(
                title: "Bota Telha",
                description: "Bota artesanal cultural na cor telha com cadarços.",
                price: 250.00,
                stock: 15,
                picture: "bota telha"
                
            ),
            
            Product(
                title: "Bolsa Tote Canário",
                description: "Bolsa grande com estampa de canários, tamanho perfeito para levar o que precisa para qualquer lugar. Resistente à água e com alças trançadas.",
                price: 205.00,
                stock: 2,
                picture: "tote canário"
                
            ),
            
            
            
        ]
    }
}
