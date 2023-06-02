from django.core.management.utils import get_random_secret_key

print(f'Development Key: {get_random_secret_key()}')
print(f'Staging Key: {get_random_secret_key()}')
print(f'Production Key: {get_random_secret_key()}')
