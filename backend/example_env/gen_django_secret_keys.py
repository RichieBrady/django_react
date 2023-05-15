from django.core.management.utils import get_random_secret_key

print(f'Dev Key: {get_random_secret_key()}')
print(f'Prod Key: {get_random_secret_key()}')
