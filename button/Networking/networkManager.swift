import Foundation
class NetworkManager{
    func fetchFruits(completion: @escaping (Result<[Fruits],Error>)-> Void){
        let url = URL(string: "https://dummyjson.com/c/29d0-15a0-4d54-bd9b")!
        URLSession.shared.dataTask(with: url){data, response, error in
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                if let error = error{
                    completion(.failure(error))
                    return
                }
                
                guard let data = data else{
                    completion(.failure(NSError(domain: "No Data", code: 0)))
                    return
                }
                
                do{
                    let decoded = try JSONDecoder().decode([Fruits].self, from: data)
                    completion(.success(decoded))
                }catch{
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}
