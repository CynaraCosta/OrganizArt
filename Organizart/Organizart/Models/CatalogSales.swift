//
//  CatalogSales.swift
//  Organizart
//
//  Created by mccl on 12/09/22.
//

import Foundation

extension Sale {
    
    static func logSales() -> [Sale] {
        return [
            
            Sale(
                saleFormat: "Instagram",
                productsChosen: [ProductSold(product:
                                                
                    Product(
                    title: "Planner Peroba",
                    description: "Planner para o dia a dia.",
                    price: 50.00,
                    stock: 3,
                    picture: "planner"
                    ), amount: 1),
                    
                    ProductSold(product:
                        
                    Product(
                    title: "Escultura Lira",
                    description: "Uma bela escultura para decorar o espaço.",
                    price: 40.00,
                    stock: 5,
                    picture: "escultura"
                           
                    ), amount: 1)
                    
                ],
                
                id: 14,
                totalPrice: 340.00),

            Sale(
                clientName: "Cynara Valéria de Oliveira Costa do Amaral Cavalcanti",
                saleFormat: "Whatsapp",
                productsChosen: [ProductSold(product:
                    
                    Product(
                    title: "Planner Peroba",
                    description: "Planner para o dia a dia.",
                    price: 50.00,
                    stock: 3,
                    picture: "planner"), amount: 2)
                                 
                ],

                id: 13,
                totalPrice: 50.00),


            Sale(
                clientName: "Ana Regina Borba Cavalcanti",
                saleFormat: "Fenearte",
                productsChosen: [ProductSold(product:
                                                
                    Product(
                    title: "Ímã Farol de Olinda",
                    description: "Ímã perfeito para colocar na geladeira e lembrar de onde você vem.",
                    price: 15.00,
                    stock: 10,
                    picture: "ímã olinda"),
                                             
                    amount: 10),

                    ProductSold(product:
                                    
                    Product(
                    title: "Robin no Lápis",
                    description: "Um lápis divertido para deixar a rotina mais leve!",
                    price: 20.00,
                    stock: 5,
                    picture: "robin no lapis"),
                                
                    amount: 15)],

                id: 12,
                totalPrice: 90.00),

            Sale(
                clientName: "José Roberto de Lira Cavalcanti",
                saleFormat: "Feira Bom Jesus",
                productsChosen: [ProductSold(product:
                                                
                    Product(
                    title: "São Francisco em Madeira 40cm",
                    description: "Escultura de São Francisco feita em madeira, ideal para decorar os espaços da casa e lembrar de ter fé sempre.",
                    price: 40.00,
                    stock: 2,
                    picture: "sao francisco em madeira"),
                                             
                    amount: 4),
                                 
                                 
                ProductSold(product:
                                
                    Product(
                    title: "Ovo Cerâmica",
                    description: "Escultura de ovo em cerâmica 50x50cm, colorida e única.",
                    price: 20.00,
                    stock: 4,
                    picture: "ovo em ceramica"),
                            
                    amount: 5)
                                 
                ],

                id: 11,
                totalPrice: 100.00),

            Sale(
                clientName: "Ronaldo Pereira",
                saleFormat: "Instagram",
                productsChosen: [ProductSold(product:
                                                
                    Product(
                    title: "Animais na vertical",
                    description: "Quadro colorido de animais abstratos.",
                    price: 380.90,
                    stock: 1,
                    picture: "animais na vertical"

                ), amount: 6),
                    

                ProductSold(product: Product(
                    title: "Bota Telha",
                    description: "Bota artesanal cultural na cor telha com cadarços.",
                    price: 250.00,
                    stock: 15,
                    picture: "bota telha"

                ), amount: 10)],

                id: 10,
                totalPrice: 630.90),

            Sale(
                clientName: "Roberta Maria Machado",
                saleFormat: "Fenearte",
                productsChosen: [ProductSold(product:
                                                
                    Product(
                    title: "Bolsa Tote Canário",
                    description: "Bolsa grande com estampa de canários, tamanho perfeito para levar o que precisa para qualquer lugar. Resistente à água e com alças trançadas.",
                    price: 205.00,
                    stock: 2,
                    picture: "tote canário"

                ), amount: 7)
                    
                    ],

                id: 09,
                totalPrice: 205.00)



        ]
        
    }
    
}
