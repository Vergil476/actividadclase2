import os

def check_files():
    files = {
        "Dockerfile app": "app/Dockerfile",
        "Dockerfile helper": "helper/Dockerfile",
        "docker-compose.yml": "docker-compose.yml",
        "README.md": "README.md",
        "infraestructura-base.yaml": "infraestructura-base.yaml"
    }
    
    print("--- Reporte del entorno del proyecto ---")
    results = []
    for desc, path in files.items():
        exists = os.path.exists(path)
        status = "encontrado" if exists else "no encontrado"
        print(f"{desc}: {status}")
        results.append(exists)
    
    if all(results):
        print("\nEstado general: proyecto listo para validación")
    else:
        print("\nEstado general: faltan archivos críticos")

if __name__ == "__main__":
    check_files()
